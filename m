Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546001F09A5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987933; cv=none; b=Ve1cDZhYK9KLSWO4yXxqUivbh6U2tGkTLfdDTTJvKYn7HCtcu6bkfzHO760d7iCbleWFcRyjFP6lZWmP4V0adgySA91q+vGJIs+8hr1tAkUCq/dQTbsSjNlDzyO0yKv6tsmVmJ2WiUzfobx26ZnDO0S/iArDz+M86Tl1imCqw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987933; c=relaxed/simple;
	bh=uz3vQj8FYbM4kGyR/T+IybsJavOIJ5kvlHU/+x+Z1EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiVXv0NEfpo2wuiGFQadBRfs6D3wYTLk23SGACCBur/Ejk8RfWquY5uNjoST/Y8+0B5652h77vgJZ16ifj8xoSE5kfwD1xRmtJY2tIWpQUNK6hsn94XhlPq1yRgWCOj5+BkcLhMPYb4ixdoa+pnd2ty6J3Oh7r+TLnDRSoe+U/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4pj8MRa; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4pj8MRa"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbee846deecso2369157a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787987932; x=1788592732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztdXvXEqMzZ0Iyqk5KJ2aSAe13KdXybpN8xuCs49paw=;
        b=M4pj8MRaqZYoGds6BkzqaVc9UOcT5iyx7rQje9HLInsDjLTFgyopazUx+XfanRiSOv
         ZCu09rAXuZDt+vjUvLpSg7sHeh9NcdUZFsvjUFnx12qIWvoiuqN7w/5BbOUYb8iTrYEO
         aCT4WJDgOmFn1cQzLkScLIHxKYli5imWRX2KtJ/mnLtjO2QE32XW1zC+nOg2tV4MzTs7
         m2zKitQN+0eHwb2JV90gq2NWjwFBifa5R8qffcjbmJjPrBwu6SofFeqdhWr10MfRUY5m
         gKuXBGAbQiajsBFZve/vnLiZ1b8Nko4vEtkwFSYs8OT99iVruXSD3w0ZUQr+iEShH/Te
         30mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787987932; x=1788592732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztdXvXEqMzZ0Iyqk5KJ2aSAe13KdXybpN8xuCs49paw=;
        b=NIsLi4h0IMlLFoQXKrSN/OzX1ntel9mrG4W2k+Bu/rpMaxHyEeLPIbR+GlABm8PEDA
         VjLWK5lMrdhaNV2Tlg5Bn35qZUPIytjuRVqZfEdNjZ/oOFX/ThYBOEk9B0IGGVY5/DY5
         paIG3BIh4bj48bFugeF905i3l6an4sT4oxd0086AkBliBe9UZ+IoHRiXyL5IapIzhTmI
         RtQsJvyJlhOIhFWX5g0GfSGY5mxR+2hBiN7W9A9rFO6vq+tbbVYwavl+nbSd+GgzUXLY
         tbZwZbQ6ZxVcpPUyqiQzcPvMdDuMFRfkklibhgpE/SLSIqVm8VnAgK1NmKYGGO9mtMY7
         j4Zw==
X-Forwarded-Encrypted: i=1; AHgh+Row5Bc7zsWh6XnySAgd8kWmYFpivxJWjTO0bU4TvrCy/iwodDuIW5vP47HCF7FEowDyN8Zpj+s5xhv2sa0=@vger.kernel.org
X-Gm-Message-State: AFuF++nqfbyR+6u3DzZ6iAvQ4TcSmk73mJyqt+taWmkXkJrRd9V7U7je
	5B/iEPQYNbMjvS2N3EY3IenrwPVUX2wVXUdVKLK8SonVasVFNNblGFZ3
X-Gm-Gg: AR+sD101h/BGUEaEvq3wln9ZE2ZBf+5dhJ//QBXOKvjOK94Tw+GTePrWmFVnTB+S/py
	Fxi07bbswK9D5JSX7lyeE6bWJy90fRfDh/i2I+08x95GPFE1LsUSXHYirLKj9MSM3XR/DA5sd42
	9e9qUOHQskSrLknbWYrlLTXGEm1HcGz+zXKGPfeu+6gtNVoyWqJkhzTxkJE2rKp0Iev755Fhnk1
	7JikdrJlgF6OlShc+vtpCJzZrQeKB+O7UpMnNloh1inOqICJZdPBBbeNQKSVHKPHq81ONuUDiNh
	p6Z3h9hCvnSi6O54KM8bKdkXGcSw3+Qzje8GvHqiTX5BCjGqfE9f/smnXkZ4CXijhLRlNlJxrc4
	dDihPyl9/NJDSkbjmm/qFTNxnK7I3qE5ngvnWc3DSdZmoGb/WBds8KxUDNtc1mzWz1bsNueGEE3
	1TzonTaO0fB7vxKBOs2hgdOaXLK/4fb6s80XFaiu14uKSj8t3PTs8Pl0nHFQiu1aHpUGi+LKpHe
	AM1+/j/w4aPhMAMHN1Foso+BpCsorpNqd7YAbq+iHx/cvX/ubigDurXX+uTitDxvKIpy60Al8LH
	U4rfqg==
X-Received: by 2002:a05:6a20:2587:b0:3d0:d933:af97 with SMTP id adf61e73a8af0-3d267b6d040mr18600165637.15.1787987931774;
        Sat, 29 Aug 2026 00:18:51 -0700 (PDT)
Received: from archlinux.tailec59cb.ts.net ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm18648545c88.4.2026.08.29.00.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 00:18:51 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jan Ziobro <ziobrojan79@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-am0xxx (8D3F)
Date: Sat, 29 Aug 2026 12:48:43 +0530
Message-ID: <20260829071843.62902-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-am0xxx (board ID: 8D3F) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to hp_wmi_feature_boards[] table and
map it to omen_v1_legacy_board_params.

Testing on board 8D3F confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Jan Ziobro <ziobrojan79@gmail.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..4011d2a8afc6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D3F") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

