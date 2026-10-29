Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290469;
	b=35I/xsgh2TmD0KfVJaw7yl9Y6O5+YxxR7uD2zlELenjit1BW9Sd/pGBBLyPBJF6B4QRE
	 aILdfgUnec9uoYjLhlI/IAT2NL1IRMnN4uxWvXGgOM18PBVvUQcoQfE/1SbIIE6YvzcUf
	 HmGsICl/9rMCqKd49mq/6YiFeQPto/t8iwf/fa77yyA26Ovs+Hz3qWnl3mwf/kAX3rbp6
	 ZJwtqb3+bWewVNzOfX7R9vY4SBwNLrN3LkBDz7OLzgMLBQh4WPI+Debr/VsAKNLug/JXR
	 ZXdXVgTpDBbCsuWZPNVEQMdcZYTv0L+AS87a5CRXomCXiC60k71Fc2N1C8sfC5FTCQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290469;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=c+gezYOkb4W+t+RhACqLfvuJiHUnKEHDmWG+/5llnG8=;
	b=PLBLlDLM6EcR4cSv/Gby9IHFmj7yPnLW8KhQWey2FtK5PMgfh90aeUu1XtSU5Nphctcu
	 E9T0QBmwqI8jQxpLBgwlXvBkblLPNmBdqmitKXHaUN9l88f1ZXypKJHgkUfOAI7Hxx024
	 qTbJiih/R7Jcp9gD3a+RhSk6bOstRoSxLDay0iOlWEhTvCvJ0ePAjT3yGwrKmizMb5r/K
	 UpVVFBXiqasQJRIwpyPUWT32i1HPOM4DNxawqksxOB0TdK5f1X1f2dQCAilg0MGseb5+q
	 id6+BJgrM1IIu50keEiWS6n0dfz9EkjAwNdjZRKTNQmmYTrpRKH/QdyALwO3m2B94xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A91606A31A;
	Thu, 29 Oct 2026 16:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1793290452t63a92015
X-QQ-Originating-IP: a5FdOwHCEsy3qO3Sz5jtPqZ1BlHN5LmsEg4zfBRZMqM=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Oct 2026 00:14:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14806656503456885674
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 30 Oct 2026 00:14:07 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1gZq1bF4FZlFrakTwR8aHQTx7
 lZdfov3DhAKTAJ1ckCgPwvPU0SWJuB+duoJuYsGrfQnU7lCcUYbtS/IgQV5HscNrfW5b8uqKpy
 BWC6BPO/Ptfm+lq0dyK33Cs7zApgpNFB3AAAA
X-Change-ID: 20261030-sc8280xp-iris-iommu-aaf3fb5774c8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=sophon@radxa.com;
 h=from:subject:message-id; bh=mC/ybUWcxUDhCBqok1LEiGW1RFywviqCyzVqxI7oudM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPCy7ohS+98FCowsdr+u4FzlHV0Y/542Y6HH2iuyn+l
 9Ql+/jAjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABP5voXhf81d55XmP5+1FKX/
 5Xgj0SFkYRh1Y7XTVqcTDE9O/klaqcLI0JCYmMmv1jDtd6uf1l/PNMvrmlPuPl7F5fCofBnL5YS
 J7AA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nr9+mHXfAFYq+3MqsJplQ8pUuR3PRhZVktNQxyyOb5i3rMak0F6KN+Oe
	bqUUhmETuE/t3svuBTv4/6fvqdsdMWC8Fee4Y8B6GFNfZC+JIf4DK0yuBwPro0k0sb6qSet
	L/P8/saOde+5F6YKJOtf7kCN359vsIc9GT2PKz20o6AMWdEVLyuNt0242LXRkgEY0py1nF5
	Dsjksv8GJoOiLkl0PHpgBME3nk0Sv+bO8bh96bsPjfob3q5aIiHSp4szxU37QpUhH5xGTOV
	EaM9oTIlqlX7dJhUTX2mVi7XD0QqiYZuDcfkEbYTxk9EP0wxwJFw798+jY2m8J74RXpk4WP
	od3OCQTPb5RjQTbX8tPp6MClFyAQ6kv5ZqUbmew5GwEmvv7p/Zj4jwviK2Hb12dY7z9Iq2K
	Yca+o4AhJDjlCongV0ZhkBX9+CfkKg4EBdczeYSzji7wd5sHfj2Tm2ia+fA3Q+CNOzpTvhn
	uFXIR3WOen7SR25320JLFgHpxxe23idGtNhHLgCDeHZiiFLYCwwGRYzolLqYAmfSRRwvKKT
	nhApDYyZRpqUHGJ1ga3LgtevRUBSSzYA5V5Lij0FylKw6Pkse2R1MLly6hc+86zBsXsDDl4
	EGwVQN4wgx76UHf1X4m787rs8laSn4aidkc8hVe4GGh6wozkK3HLSvxKgQOwY/rGd0yWsn3
	mvjpQa+usU38nI9IeMgg/8R85L8oyqYN7aquGVxHF8lLtGz5bMVhJYpXdA4s5L4N9tsdfPX
	lXTcpSQrD3jN8M53yNk8WKtYUtGSvyOVGdcNaTzIruvYKfXMqxGmZORiGJa3i9xdSVstxpQ
	SzMTv3lxC7ouRcsPjwhnXKiUu2bAFYqradzMi5dimb0B5ONRMVFiEdhGCEw1nmqpKKXtDrp
	riFy+8jcF48aYpGk+oTpvfRxQiwJu6nY1LVnp8DZO4fSEfSK1se2SwXx1JM+xu5IjaDV7xG
	Dki9ibAsb7AqM8DWia8GGztI7VpubSE4zOpF1ubbKrAav3JTtgOyZ2AGJpcBhVvGZXcYww5
	c9zzMFSEwoz5ZPA88o
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The Iris VPU on SC8280XP can issue memory transactions using stream ID
0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
transactions are not attached to the Iris IOMMU domain and can trigger a
non-secure SMMU global fault during video decode.

This was observed while decoding H.264, where the faulting address fell
inside a DPB buffer mapped for the Iris device.

Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
the SMMU.

Note that the issue was observed using Gen2 HFI firmware.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index d17475c3e66c..4ab01ef9ac05 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4268,7 +4268,8 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 					     "video-mem";
 
 			operating-points-v2 = <&iris_opp_table>;
-			iommus = <&apps_smmu 0x2a00 0x400>;
+			iommus = <&apps_smmu 0x2a00 0x400>,
+				 <&apps_smmu 0x2a07 0x400>;
 			memory-region = <&pil_video_mem>;
 
 			status = "disabled";

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261030-sc8280xp-iris-iommu-aaf3fb5774c8

Best regards,
--  
Xilin Wu <sophon@radxa.com>

