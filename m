Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0A45041C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981665; cv=none; b=W2OP94eHqLIixm0KvxMKaDoWR4xdDtVzWDO+Aaqlefx2IPxQLMpn9Wg40K/y7XNfS6Ep3Eokp1GMRduqD+D5dGfitHHbT3H+qYddeHi7jVTdT1AYaYZO4DZugF4+eQ0KJWWLU/JwO01HYHCLya+Hmh8KDTlBcHyIIkUAu+Dkc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981665; c=relaxed/simple;
	bh=3GC0tuWCP3j6JKOJWFFNs0dRZF5bEAVLAyXqilWkh4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lUF68gsg0jaqPXlC2oYSXE8Pz0K6jjmZFTeJB1tVaB2Byly/UKP+mZJK0UrM9gu0dN269KXkDeD/ZhBp4A5yQaX44ZhX/rBZMlLgCbyd14gZHpoy2ITjTL6UttcRhyxepqotj2gZOlEHCxdFXmB72h/+WW9bwyOxduY1HqnoRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=fkv4qs1A; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="fkv4qs1A"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so13906315e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981662; x=1790586462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWLqjYwgWnzce/Di5lHAVRJNRcVeLbBZxhfWnjxIPYA=;
        b=fkv4qs1AC1UyQaMlbyClA2nvq8p14OJPdiclF+jcdySRT3MXizpSELUtzUMldZBclt
         KtPm4E+PRz5yJdWXJ2KzzegmcGvwmlB9Txf2r8R+p6aD49GnwTz3801FkpLs8oq+IQvr
         BNIUq6ZybERd7YmkokfyTCPgM92zC3cKRNztY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981662; x=1790586462;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWLqjYwgWnzce/Di5lHAVRJNRcVeLbBZxhfWnjxIPYA=;
        b=yduL48DO5hPxgvQN3mVbMFlpoLGZtwn07UO4Q0ttLdesYPoT2ouViMEkXHBuz5IqfT
         feFhm2ONYjnmqnUmHTcMLFOmXI6p2plBPAApFeUxNFzBITRuPh6X8FLjFSDoJTVQdL6f
         mdfWpJCvl1q3IH+vpaBe5rW+bG626Axm/uHlUXn6t4T/yuRJsq8uhwsmT9/vDOjVWaI+
         ahZmguH9MOyPdQF/wCPV4GcZe/5erMl7CzG3G82Oqt5b7PfR/gVXOXzdJRH5K+ub87we
         ummo9qorrStggomS4h2vpiKzG4te+g71805xjWxAC6mHAf1DM7aS892bk8tA2zski4lm
         HqAA==
X-Gm-Message-State: AFuF++lfr6KPQYQET50CK0vOrgST8h7fn8CmPTwu5+TK4E5pcGli0ImC
	MmbIUQsgKYwhHEcxNXMgjN8GvfL1QsphuuhqJ3ekL3vGUTZcg1B6/mvVZlOCsPtEXYfLzpAhLwp
	FqYIMU0k=
X-Gm-Gg: AYBFou1iGRDDcTosRShAFRxica22T5hAjnTIbuo1gtq377UnYZBsQwI5WFxotUAzHe+
	L+vFkNwrvFbGN07kVbUsJPKnMEMGH+7dOqxJesjge3iyUp+XCdj/EhJZbCS4EBQPZPikyzIj0Ia
	7Ovt73Eo7kVRla3Hmyb60u+p9b3TsGBasHS/JpTJUwJXAIaACb4vu5rZf2VE01uzzd+6Yk33kqY
	914aoyOhuax6VUmCN7VK3ZQCk98/Ti7ILi7A6ELTHCVzYiV1/dz1gypf7853GmdquxWpV+4BLDz
	i/14hHNyQ6qyFzHDYKd30+/aWAtSD+/ESSEeorhqJadG5Ufq+HuQTkGMetv3jD8xP/a3kvsEcxu
	GFh1R40zfYzqHbucbwi6HekXPBb3Clq1fJTSuWodQerPF52cvej6K66G6OHQiQPTrYdHqWQ2uJp
	cEP5wCSnrm6Li07h8axJYeTViHEhV7kkgmqvP1fpa2XuEQgTiQPiwh37IrBUmloS4zS4loTpgaQ
	c0dGHemjO0PYPDZ
X-Received: by 2002:a05:600c:1d06:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fc56aa3f0mr170381985e9.6.1789981662454;
        Mon, 21 Sep 2026 02:07:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:42 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v7 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Mon, 21 Sep 2026 12:07:30 +0300
Message-ID: <20260921090735.3174292-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

