Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC5547074
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786748; cv=none; b=jA7KOJawJYxbm2vQv3m1qZJ/up0mJ1ZJxSfwZfIO64P11yOsUVtY4KmXw+OgjfVwOSV0xtgtFQ+DYL3Ipc59iFlswSWC0EBFVVDtDHu1C55BXRYwRGlOk++E8LJl8LXbUzdShtrrvvMSi4W7G/s6g+ALUnFGGIOWuq+HYjYlm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786748; c=relaxed/simple;
	bh=YajLatm1N39wTUS/2spLdpOg4xpSAjkOcr5obwgS3UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T5ht7nOzYZMq3rli7osJHokv4eAUDHokTvizcYQoG4KvsxjiTNrPmUJFiz6eU13DukdrfeOCAF6ZEEblXT60TE3PGMrMAYejbdhQ2RTjieYQGr2GOennn1xLwQbP2noR05GofuZk/8eGpkNaPWux7bdpzrHpeK1INH3130Brzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lymfHllK; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lymfHllK"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so589177eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786745; x=1790391545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=lymfHllKscqLDzD3R93ZSc3qD2xCgtbE45+K3Yp/DSjoIPXMckFFGRJXyLjIInTODH
         4mMFtJoKUmAsmEtbC7C1xGn9IpH0jWwxpsOJ5sxmMIuJ8t5cVSOkbwYVwtoC77upT+ag
         NldZE7TD4Bmg7NT+bPad/pYRHSkN+2gObalhnPPypnYfelmzOICOz9B1jJVgmO8wjwoJ
         4ioR6xFIY4pxmZh0gZxjRzFdSSyM/zB8UsblS65Dqg3O6yOd2Wj9MHLyrxhA4GHiAgfU
         ZwtIMQjkogkxe9YY5u37s6FN2nxD5U3tUr/BkoKAad3ugphmkgQXo0bdDiIhwm3fqW0L
         BBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786745; x=1790391545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=HA2d166f+pxY2A6DtUA6MovuVn9LDxuD/O+1VF/333OvT4yDc9KKg5YHjIRN0++GOl
         JC2bC9eSIoOKrlRfi3cbW17STBYQ/ysFf9QZ0mVkiS8O+yHPECOTwMKPw/SsC7eLlM3L
         O+fTHvJks3pASFkQ6GABZxAj42KMYa/nqupxxqjdEiQ2pqqb9CgBhsTP/50vX1nxzI/M
         SAIs0fOT87N6KvftFbOTLmNGYYPIXi631SBvt1KmLNDQrWuK492Kw8TFXe+s+lhs+THm
         EVjOo5TipUkyQE1Yw4KKfqN3ko+H4614K1MKcG6f/5KQvH1bnnZ79QKfT5gnj3u6pYcZ
         ki8w==
X-Forwarded-Encrypted: i=1; AKwUvBz5DP8CS0XVMcqJ5txHOFstSUHk1X9qZ0XXfe2Gm/muq66XfROR/+Ew62JYmxKsUU2JCrk0E7f/wpDOjGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lnQHllNNbzuuUI+RJIwRxvuy4dBDVb7Q1NYAxoOanj/dpkR+qX
	5Ye+OONFZeicdbLtCM4nAwgVuu+iUTBo3T7zlvr3oDzPOBNJn4KaIMcJ
X-Gm-Gg: AYBFou3bmYzm0ZOvGCamyCaNwD92YtwWHJpPaKWShUnfpL37oo2oy1C/HDPMdX/4G55
	Ap+oi3L3We/4d26tLZ/+7LQTWIrt69ZcS15yxLmJbKxEgHB+MQMGwA78uHbMWdWnbrU2PvKKrQd
	roL0/Rw5oTvqi07Dg/IQk1nRrgKqTTE53aO1TyQqZJKT15/Z9CU6ComlG4olVAfYkReaPMXmVlA
	zIbV2Di77fbPRU6vyWmtw1CdLOPqkHfODdY9HfwTgT1lRZuSMEjEEam2Nbj1Zhdp7Jv2sqtcKRp
	Q7qeTu+sQ0h3Zf0+o6JZ6XSaHxFnr7NMSfC25ZzzHHkwDzOiiVakg/hVbMiZON0ZAwMZCLeter+
	Y/qlx33PbmAL2lvk0nQ4LtONqQKagpzmqFBaW9AqJs1wzwAOGdk8HQcEdwcn5oxyhjFQ9Mly55/
	1ShhN8CrhDKG4Un/r1eBt3m1gZfK+1xbkhL6iw6OaXHWoddLSrf3yLIOksallioYyyzfwdAcWEN
	yKCdqfHz6G84Me9UyMT3bH8+B+m8dcxqgkzW2+2sXgDEx5drMXfjuYGzgYTwzUiqxleaeC74A==
X-Received: by 2002:a05:6820:1988:b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6ca9a1326a3mr4442238eaf.3.1789786744895;
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: misc: convert axis-fifo binding to YAML
Date: Fri, 18 Sep 2026 20:58:58 -0600
Message-Id: <20260919025900.169703-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919011417.156828-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the axis-fifo devicetree binding conversion, addressing
review feedback from the Sashiko AI bot on v1:

- The FIFO depth properties are documented in 32-bit words, not bytes,
  matching the original text binding and the driver's own arithmetic.
- additionalProperties: false no longer rejects real-world devicetrees,
  since all properties generated by the Xilinx IP integrator (even
  ones the driver ignores) are now listed in the schema.
- The now-superseded drivers/staging/axis-fifo/axis-fifo.txt is
  removed, split into its own patch per
  Documentation/devicetree/bindings/submitting-patches.rst.

Daniel28972897 (2):
  dt-bindings: misc: convert axis-fifo binding to YAML
  staging: axis-fifo: remove superseded text binding

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 150 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       |  96 -----------
 2 files changed, 150 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

-- 
2.34.1

