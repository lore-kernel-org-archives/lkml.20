Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D9486E62
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637568; cv=none; b=qELTK7mlqkNicVAwx6SlUREGSoPcZgbPdWCLc6iyKN3aKalmkrLB7S3/CWUY+9Ww4rKU8Py30sUML7u7bTX0VbXoWmnLBNu0yLNWoQoP96xEYJIh/FcgT1ZBTHLEU6+TTvOAANlqEOy4bhraHJnU9qAKf0+BoMJgsama3gc39ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637568; c=relaxed/simple;
	bh=FCGF26dCddhrQg7vYYo0pTLzkYH3qozJaaCKhDXyBpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhGSPHzbXVkA/5QEBcWrGn/KGa98ndyYqjhNSR86vA0cGA6bRVLeJB40sTrphAK8y7EgddDw0elna+Itm5R0NY6CywSDNODiw8dVQpFgXEbldgT93aiIgasCXsVQry0hUxVzln9Zp/r7+CJZXvgSEYSAAbCM/i5hxCUaVaWl+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtt0skCi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mr7n/T2C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtt0skCi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mr7n/T2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
	b=gtt0skCiIEJsKpTWqhExqJuTOneg9yJrZyhdRy6ogiYfVKosAiIJ2E5Mfu7kD/c0MK4zNu
	wrM2wItTtvq1rik8fLebt9fcQbG+xyoVwef9rdowTsOH9UyPZNV81VThLv+nndLHTe4V6D
	D6ZcXfinjnxcZhVy4/Kf4dXnkGdi05M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-MRcp6SWbOB6hoSArVnLr-w-1; Mon, 28 Sep 2026 19:19:13 -0400
X-MC-Unique: MRcp6SWbOB6hoSArVnLr-w-1
X-Mimecast-MFC-AGG-ID: MRcp6SWbOB6hoSArVnLr-w_1790637553
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8881abf79a4so50630187b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637552; x=1791242352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=Mr7n/T2CvTKN0+XEXZEWU3gom4OW7PgoGKMJ5TFrGDkHxSXhguaA04dVf5L5KU62X+
         fcBuocLLuj6IGLTDU2FDIs+QiTzOJt3WEeGvJPtVQtlPhvlpktTDim6ANamvm1zgfYYv
         ME9F6NG3CGy7YOm05nHSBUnaUMVvnPMWYIGIz6Es1tgWQqjwSpr8m1MMMibMNWLSGMpc
         x+8MgyL4Q0wIA4lEY2iJ4TARn5WqJ/8lqWGBCuAPXSqRnwwxchGVaexeIERQn2IuGhpF
         UO0qspiSA/I6P7Z+oL3s/mOtxi60R6rUplYvrLZcTBO1bBVf57yxWwlE5qJT8bUlz7VU
         lb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637552; x=1791242352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=IrU452ov+O62JJ5a0cS6CPbW5whbfXKvVJE5jQXOPONGsJP66kEMvifd4hWufJYCnA
         RsJuxDHwYRJQx7i/MX2ks+gAMA9aBqiSsvY95MElu06T1TboAXWg/W9U2Zkfxc1OfjgJ
         nx4oP+vUTdJ6aeFOlaX8K9UFyJiwzZrB5ZNtaeAhTJnzdJhMcIKVw3S+a8n+wZMQHkcN
         FusFM5zqYuI+VPbMxQDNVu+kXyMN0nJHvWjZe6FWBIGJ/k25py9zLfU+0nNR9S0/CRre
         5xy8c7K3FEg00TpR3p2uWE12VRp5x6KFk3MpeN51OjobGE0uDKP3kRbFtxcnLYIbGksw
         AUdg==
X-Forwarded-Encrypted: i=1; AKwUvByIiGZk8DUzhRcd1ZcmnzEnyzC7dha9axJeMZC7mnoVAoQ0Cgo312qNFECn2oJG2VMQvlfIyLnepSzJOaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9/ZPf4Mq+T3+N1z8GduZQmTSWEkIQJnI8ThDMdjKrwH1NgkJ8
	7FW5g2w1elCighhV8s3EckRZQj77A67Y79dqRqG8360ocbsnEQmdrSjTZwlBwez1ImwR6+DeJXw
	VfrbU5W4J8bajYumQxoChgM5OpqUA4gZugJiArkEcuuqE9dQFCnWTd3VKF+H6IuFJaQ==
X-Gm-Gg: AYBFou3OCsojieFcPnA951e8oUZl1uVvRflHT3q9o4ZPYT916evZdh5iIEXzpTuOvUe
	a1Tn05p7PaO9/9zEIaa5uoYb0ixC9GjZqBR1bRslcbutD0nDanUQV+jghBWw+zDiKolNjitxlYP
	VT5XsDK1Z6m9sUVryVQ2J/JbK1Ks3mxUx60ylxfNhBP+9G6xJP78BEGAIQ4ktyO7RYOL4fZ+Vp0
	liTKpSkow7QbpnU63tcH+zDtgGlWPkwIHtjhTXK9lYvvP59gVPfmv2ylzkxJvnl7QP7K7z/UTOL
	rNeIJpcAEBX08QenWw41MCfSqP5VZ4n9TIwt8+xPMVwdvovBeTFyDQ==
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038737b3.13.1790637552657;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038647b3.13.1790637552245;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:10 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Mon, 28 Sep 2026 19:18:03 -0400
Message-ID: <20260928231807.1757995-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.

The USB Type-C DRD port is not enabled here because the necessary
drivers have not yet been posted.

This is based on spacemit/dt-for-next. The USB patch depends on [1] and
the PCIe patch depends on [2], which in turn depends on [3] and [4].

[1] https://lore.kernel.org/spacemit/20260928205012.3689405-1-aurelien@aurel32.net/
[2] https://lore.kernel.org/spacemit/20260727094726.890179-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
[4] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/

James Morris (1):
  riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jennifer Berringer (3):
  riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
  riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
  riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 122 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   |   1 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  33 +++++
 3 files changed, 156 insertions(+)


base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
prerequisite-message-id: <20260727094726.890179-1-inochiama@gmail.com>
-- 
2.55.0

