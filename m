Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930907;
	b=WL27CKHHUifZAaEo9K92pwZ+J4ndyor19eNdgHRlNEwdl3XaB8eWAh390GIXOm13crwK
	 kjBjkO45SVgyWdgzXOeeu+HFrkjQDdO0cqliS2J0uBrsUK1ZjlSVq5jxEtff0gQFTC0Fr
	 ZrN+8/fS+59PaXMrBQVO+Cq5GbYEt2z6yM9OPnAjfuB/vgIroQM7pqDb7AA9hhyQCVmXN
	 juPEoBh8NbrkY10dPE5tCxVu6+NmstLDQLpIAFlQ8RqF809823psRdYroiVaFMluPRdP7
	 5W5v4V3ffxd82EflGuJQrjSJcxxvy62ycoo/T1q51/yGMLt5+8W7fqeFjd1SdvrYqyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=;
	b=yt0yZZ5tBUgwksBCu9K29oOpCLMV7HTMngWSeHocyc4Z6sRRPVvopAjqiO8m9ojCPrm4
	 3kXAZu9yfjlk5Wg8DaB9ULljtTN6oS5CCcGo9KyUA3g5gUdUEDoRh0Ot8Yr3TV9YKZcLk
	 s7E5ponDGWbMqjjIuK8XtLYkp4a/yBAxnGGCkxNEfHm6Z98eK7wlbLX4+7gITX2Y4VZ1A
	 fPkywBrSddteA4zpXzWmfDw+4q8nt1sDZ85C1sReRSKTk7lA+DchA5/S1quihBys9yi2m
	 0/beUAXXu29WPKNY+j6vfQC38g4v5TZ4b3/mnlsuJOwBCGBa4lUtJBluHWkrb+3gvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUzEdP9w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8skVmq6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D792606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D792606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUzEdP9w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8skVmq6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeTBe1308247
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 02:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sY
	gg0jZ6eQ=; b=nUzEdP9wl8T+wVbNvUHQNbNYOp805ZLOGUbPqvGISohFkbl6eko
	ba311OLu8/745KDhbd5YBSGkizx5HwUOt1fnck4enNBHX1vtxC1vqYOg/ezT12iq
	j8/eIDOJfpKBVmZ2EGygUK0gJPYQJiJ23KaYOKWi/7MyE8suU2UyDJ5vKd/3dsjS
	uoVigoEbWhr/HC8wUvO0nZYW4n9LkFEEaDPhZi3jIQ24cKP4wT5xf79sbb8W5yIX
	4UL7y1vaeuij+CtsKW5xBZzomIS8w0yz5wm4kyYeBNQGzwRv7Dndnffh2tiYdmYO
	SQAn5rcu4M6PXAtsk+sBfvcdwcGSPbvv4cg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p98drq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:08:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so284394eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793930905; x=1794535705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=;
        b=U8skVmq6m0CUGBrFFOcEUUmNx6kaj4xN0x7lQKYZq/SLBoalngQCgUAcuNoCnqzPJV
         QN0wWSCC+GPnRM17c/5V7m9UHi5O1XC2PtlERNI+Ec2Ve6pkD3Rfz2m+Opc39rRpWnJo
         j4mP7HsrlvE00x1erb/MSIgRLjSQvT7Hh5dQT0sXEjuor9Kal1PcAIOgQKQ6uQQYdeCc
         U0IuxFzhjdNasXXvyBvf0Xg6F4Q+KWLtoRyfyHtUPpgfFbRtLXtOH2X/5f4KyG7BKYRh
         CPvIWJWUzrVkDLQWaYPYPGZbqEzuOePScd3lgOXTIIk5ANKYRkKIgDVc88D2l68zwSSk
         ABWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930905; x=1794535705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=;
        b=sVTrm1nxEgna4j6nLvW9j27A/s4Pkir7MWPAHPMgFLI1WtC4/cNslUvHae8kn7S6+0
         k0oLiBzoNNniwDiQ+Hiy76K+G0FZPq3F/IVUlne2IriaTlWxR9FccIaFkvvdGHrweBHi
         7ckvSA65DyMWznfDlv0I8paQntQS6ShfpFrFxXQ2teVCveEDmBuWwDtll5zv0FzoKIsH
         9APbHapLrHluSNS4xqQnsWCtPDcSNRG7fjqTrPy3ZPhuK8E89S707oXyScm2qIDfQcKB
         WAmR0BZihaEN9Z42KSeEkBOi+ooOFNHQ0utjouptlbMS42WIPkByMHuiPtKLK5kOWYJ8
         05yQ==
X-Forwarded-Encrypted: i=1; AKwUvBybYCqVEk2fEYfhRAxJhQ5vHaJx7aURk5g8zbh4v0LptIqjXJfJsxGYkLEeAKpCUGY1wsy1LsHVzr4Pxo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wTc+Dl5Ge9E+PfZOTwKuDVtx6Ev8uqxU2MjCi/AD3K4RepAx4
	duDzBpreMrNMm+/PVHy6pqaL8IC+p7i+VK02UogmLcyNR+GmrUW3w2OEKlMNIiEUB4ZWK7cj/3d
	9YfqcNK68utQwEwDzVHJooIXhvpi2umbjp6RHWzO1gMwLwEps0Uj7jtUO+bJ6RlQYSCs=
X-Gm-Gg: AYBFou3amO6jD9sr9yZvg4WbzXKhNBouvFUT055UJYcHJQTF+ELmtWdsCg9eKne/GMX
	HVw2Oks+bwZ6BeRWQjChQTPMatKs0crlYm5QP5nMDf90aK7E/EkS8hrRDD8MkxSpqaPFkSpWoMP
	DmfoBBzsp4A6VG9Mo9tCORoqTEBPFSFxf6K9oRYGVUgGTrpm5wGJRToY6UELcNHk70FuLS9ab3P
	cic+R3r1DVQP649jVPkhI5Xes4JCLiv/G0V3AtNNZ/P/PQPQrHRBd6vpWC6z1WJL0N5YxsfhNfX
	oJ7btczFz3WmAiyq/FF9v9kT1nFtjAtnkLH6NUaIx8OzADvctSY27rk3HFgVNvxIOhhO1s5OGOi
	+yI1hFmB6g4rFCesWul0+TTob8ngy0Qcs2WqHz0mbzwe6nckzIFktW1sbogeIS09KzmqFZS42Lu
	LKXhuBVC76
X-Received: by 2002:a05:7022:4183:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b25d30ec8cmr1490434c88.20.1793930904784;
        Thu, 05 Nov 2026 18:08:24 -0800 (PST)
X-Received: by 2002:a05:7022:4183:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b25d30ec8cmr1490393c88.20.1793930904197;
        Thu, 05 Nov 2026 18:08:24 -0800 (PST)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm1324796c88.9.2026.11.05.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:08:23 -0800 (PST)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
        ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
        linux-kernel@vger.kernel.org (open list)
Cc: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v1] wifi: ath11k: add usecase firmware entry for QCA2066 hw2.1
Date: Fri,  6 Nov 2026 07:38:08 +0530
Message-Id: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WyLNxz_tRvhWeGPZ1Ymu9_bqeS1JlA7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwOCBTYWx0ZWRfX02rcUWINZojT
 Q51tfc/iGvet0lWDpa2FacZ3eNEHXL7hVqTu3jaNK9O1LfRg4QdA2Kl6nmXIT5DIuyxImK/DFN9
 9P+4VV5ObaTnvpR2WWVVmBZvqn2CbT63ESwuwQ/4vuD9NOnmTU3Uo6VXEtrtPTteptsMBzFtfpQ
 3HhVwHDRY29rt5Lg3sD5CZMf2YB6OM09n0dfPuhBMwrgDcMkB78tJl2t/XamjdB+l8lw5pWvErv
 4gHYIWoF/IZG5xM512UYY3s0bbqyJaQxSW/rNEjE3G3BaDXn15vZ+XEehIaNSnNh5kh7PXRzRyF
 WSfF2A2H73q6+T2R5AafcwDxGs7yTui9Q9iRoGEKKe2LKxtGFKrHqLA2gH30PUZd49NOTc9NfQu
 fdGFjj0OAItoxEKptGLofitPR5Y1exF8R1MdqPb82rpPyrjul2e1o/maPaTsfzZwkNL7hFmI3uA
 6MJtXyXZ8+Bf+w1h95w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwOCBTYWx0ZWRfX6aG4dAvslj3w
 Dim7ehWrsfWLtmy3xIgHIpptxfS9LYGam7a+copFBdlmcH8HS3qy0wZCfoAv7UwvRdb6ML1IqTW
 76nmP6SaYLNV3DESS8uazphVyCvzjMg=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed3699 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SfIHIsIoJ2N3z6ihRgEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: WyLNxz_tRvhWeGPZ1Ymu9_bqeS1JlA7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060008

The Monaco Monza platform (QCA2066 hw2.1) requires a usecase-specific
firmware variant located under the nfa725 subdirectory.

Add a new entry for "arduino,monza" compatible string to ensure that
the correct usecase firmware (nfa725) is selected.

Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..b58dce133244 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,6 +1049,7 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_QCA2066_HW21, "arduino,monza", "nfa725"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},

base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
-- 
2.34.1

