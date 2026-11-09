Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228496;
	b=ItdjHRSAq6hM3tpg44Hv480tU1bveaJYhenV1o861WsyAybQwex/qzJOcGgQD7ZtiQvW
	 I3zwEOZI+HCmOJFANr6ZBnFp/BelQEROpae3BWJNXJF65mswHIiQRpT4QoyuPLB2Bsz6w
	 1BmpoQHk15OhhDtysn9UOw+rNBeCdfTtHRRIWeU1KGHkL7o9XZm5aclClb1JJYSKcNYzX
	 26OZ9E8x0SlHuZhcrS63ED2Od4MKCPLpgTTXSuPR9OnOa3pXcB/9FER9gxXi86HasKbJS
	 NQoBzzQ3bF5MUI600jK8ZtoLtcImTA7yBgv5WxGsjypOKD9PyYSOBaQOV1y7+lqMjVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
	b=zLQDx6ACA0exV1a6hmZagCkFpVh1dMHvH9liLmq71mfcTrwOp2Ep+Ln/7NbNxOJZP1Ry
	 mKUNk5ehupcgvrKA04WEAlVTv5Nt95MkwFJQBFueosi3Gf/W4KfAuBgzkFtKhJrKvVDKN
	 WGROpDvHiueIofrH2EbogeCjeyzBqY5/PjOgX6DmlmODimR038mDK47paHCtT2IQ+D7Xg
	 ZowHdxydJprppPFDrQNy9BFcsZg/xED/ZXCjFAtB2gZS974dktmDGf88BFX2qucpAlz9+
	 4YBx53NOkSPxTw20lIHrYLm8/kC8cKwFSSnVgCyDqKXpzOdV6XTASp6YnTOQ90suCIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FEF606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FEF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEQ5A1193197
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=; b=Rz1cNzNq172Tkyx5
	gITH2LVZb1HIq8a89fhb7tq14z3Nn5M/IYXPCpuCCQAMulaDcXbKlTyVvp//Vl2U
	JJoR+aL7RfEIZZ+NkewMCWT7AgaCm/5qEFndmkyn/5nqMMrZqnyjRcjW10IfXo0y
	AtyJnHJnm1BcH9RKhZwLQpnI92amlxy+ArwfviWTtS5UfC65xQjF1rJSEXyk4rR3
	XsKxQM+6Okzdzuu+Eckc5ezElKnF+hYuPLPjg4JUPElSREEvk9p+GJ6icJt40Spu
	hra/rRJtR+mIAoHxfmf+7MqaOro6VgIPzZFXEfXgqzuOZyL+t1rD6jARU2N6lsLS
	FiFFbA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qr3ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:48:15 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0e878f574so10922157b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228494; x=1794833294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=BIw6kd0StHfoLi7OEAyBRrBkoqNL8ilZVvFwullkQLla3LaVMXUooCOqfE9bi+ySBz
         TpiA7IxG8z+A6eJ14J6/xcOv4y+mNI40lHqKV+vyqq9i16997Yv8dkcjmnbFkOONNjdo
         CeQmZVTWkvC79hRhwNkdRtu3UncHlp7PWi7wWNdyL1n5ye1lpgWY5zwM4MsxggNEtqlY
         A+opcUR7fYu5knU7yQZPlzZbfiBXdPJnu46Nlm+NMZNHZO8vgxYPid4X2CkQbq2FIy6a
         EE5+QneoD3Uw3yIHOdH1NlxvMRy/6QV8mrMcx7VCfkhXFH8hLwj68MixHmzrvdN5a1/I
         FTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228494; x=1794833294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=rOlYM4F+Gs6TVGUPleYf7+2rExosjc1CKmKw6OguL1EH0B2tNeE1TJd17rqYLo/4c5
         LQLdlT44ENhNAf9un1p9XSR5muu86QklTWAhoTObtcEhaisyuDgabkFft/CIsaYi7YnW
         lrBFfo2Sd6CDErIusf9DaSyqN9j2HM2IcEWn4qLD5U4fPeh99Alzwdxz28immesPUYb7
         9/6kYqZqjd5ZgYbJGcsDPYs9ZLSk3JH5FbQxYlrY6QJ+sOEOgsZ2WuvcYfJ4M5rILusw
         tYVPUAhC5gQ7Nru+R8MHPOJkh/e4wkaTfHgfBycKGiUoTKBvUSjVlbUz/kD7yZ5BEocA
         +KxA==
X-Forwarded-Encrypted: i=1; AL+hErE8ru0OcAaf3ewTDa876RHv9WpTjtqQ9i5gEJIdEfINZ8mOU/jsLmLsQQmey7o+UjJ1AClAIgGTrCGOP+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8TgsETXzAmq80is9fmuZBnlOwwvYrhQNLaFOcxGOdxAgy7o6i
	mxTmPNIWTHCJacW8glplP4IE0mqqffxC37aOo3imgohHr0aFefQU6AUu+e9cqyXrd0cB4pxHbtp
	tgwN18vg40G8Tc2c7K5s+xNuimvc/BbGAiEmGmaoma47p/OxhmrPvkQh6k0lJxWuyB7E=
X-Gm-Gg: AYBFou08/Y+xeRg1RLXJ2HYIGFiZwkrgE+ke+Q13wjm4Podz50cmm2FikRs4BayFyxH
	ObpYvVVUd0xhTe6V/trslga2XmZEDzhxP078FzN9vJYYwXAcRlV5nd4E+I+POEOsNCWurWawYkt
	U6znC3SAr4tBljr2rH9ukMNjJbmYKl419qS7VH0aGOjsQzTZX6eGbigrKhP2E1W4N7Lm0HKGS71
	h+SD0vg2QMPLlcit+kq2CT9zB3UL5tUdKwM7e2B53IhNhG+So9xZHDOZonWqGY8aXJFL7IV5Sys
	TbMHDAMpGJGMP8sARwfKNLkIPlrS1/FkF6IdqQ+ksxNoEIexQRaWKc2/Z7YiEFnhpykvaHlkmKV
	/2Rmj7XNKZ4tUoPzkrE4U7BcHEnlYwjniyVAkNXHwmz/bVNr43UzeFAHAgt+Bu25S8tQKEZ87/j
	UORR1+ZPgInQ==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253737b3.17.1794228494358;
        Mon, 09 Nov 2026 04:48:14 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253337b3.17.1794228493700;
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63209asm34191627b3.6.2026.11.09.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:37 -0500
Subject: [PATCH v9 4/4] riscv: hwprobe: Document that keys describe the
 user-mode environment
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-4-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=E7QUgZlB4TXvJCfVy01ud6KHHfflRvYJVHUOIS1HhZw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB95MCqjkXT7f1F5As0JPn+nSzu0TmMq7j8RtO+uZ4
 CcrNl2so5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACbi+52R4Vfh+qMzOLlZZlT4
 BW973ZOjesY7RvPg8S92e1a85Xkm9pmRYdXek9p1TFoP3qx6wiRsW3Bu5ovZauunM1WICZpue54
 ZwQgA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX2LVjgd7m5v64
 NxHCwlziTnTaFF8JqDsLdQgKw2BvdiVXhtMtXAfafNt6UT+5e5jWuUsCYvw2s3I6P1uS09nXAWj
 EB5gn149KGe/8fnOtNvj3++9FjDIfZR8kK2lFVaj5VsMpEZAXtdRoHdvwK1shVm94fG1Akr/HE5
 IXwlVKy7L2F+mPK6E7pPWn65H5RgKk64ezr/AC5h7SPG8tK66n2DPeA72SYrKfFJQX19eS+vS1F
 Dm0cwkCmGdTuw6Y70YxeWbrGqXE8Cilc3Bo/CO8x5HGPad1jCemxuMM8XQFmGcM7idWM8Gz1Ww/
 hhG294bENEtHVQhsDG8rJHcGMZq94OG+dVE5dK7eiEXQ3oAF/0qpMag1usPKwfLNZZ0uMy2uEoT
 /b8vQTYYfgdEJkBr1z1LgoUft689tMuKJg55ZPP0oyp0bwJWIOYPym+hLiFavobqtn4Ts8lUYUq
 TZU2EoRwuXAc4BudOlg==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1c10f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: ZXurZrJdLX5lGFrDRQ0AmyMWdSwjk_5m
X-Proofpoint-ORIG-GUID: ZXurZrJdLX5lGFrDRQ0AmyMWdSwjk_5m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX0ZG55KkzxTim
 yU5c0xuQL16HuHVBhqweEl77EjYoU0K16jp9DV6WirsQC8OHYk381IZ/yJiL2u8VG/edPljgaAk
 8hs1jqBPcihqEEgGJBp/H3E967bIDNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

Every extension key in hwprobe.rst says the extension "is supported",
which leaves open whether hwprobe answers "does the hardware implement
it" or "can user mode use it".  The two differ for extensions that need
a higher-privilege enable, such as F, D, V, Zicbom, Zicboz and Supm.

sys_hwprobe.c already gives the second answer for IMA_FD and IMA_V, and
the "do not report disabled extensions" fixes [1] bring the remaining
keys to the same reading.  The base behavior keys inherit it, as
discussed with Radim on v8 [2]: a base behavior is only usable when
every extension in its set is.

State the rule once, in a note before the key list, instead of
rewording every per-key "is supported".

Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [1]
Link: https://lore.kernel.org/linux-riscv/DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com/ [2]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c4..30dbbbc27477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -45,6 +45,27 @@ On success 0 is returned, on failure a negative error code is returned.
 
 The following keys are defined:
 
+.. note::
+   The base behavior and extension keys,
+   :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1` and the
+   ``RISCV_HWPROBE_KEY_VENDOR_EXT_*`` keys, describe the execution
+   environment the kernel provides to user mode, not the hardware as
+   such.  An extension bit is set only when user-mode code can use the
+   extension on the selected CPUs: it is implemented, and the kernel
+   either has set any higher-privilege enable it controls (for example
+   in ``sstatus`` or ``senvcfg``) or leaves that choice to the user, as
+   with Zicfilp and Zicfiss.  An extension the hardware implements but
+   the kernel does not make available to user mode, whether because of
+   the kernel configuration, a boot parameter, or because not every
+   hart implements it, is not reported.  Conversely, an extension user
+   mode has turned off for itself is still reported: the keys describe
+   what is available to user mode, not the current state of the calling
+   task.  A base behavior bit is set only when every mandatory
+   extension of that base is usable in this sense.  "Supported" in the
+   descriptions of these keys is to be read accordingly.
+
 * :c:macro:`RISCV_HWPROBE_KEY_MVENDORID`: Contains the value of ``mvendorid``,
   as defined by the RISC-V privileged architecture specification.
 

-- 
2.43.0

