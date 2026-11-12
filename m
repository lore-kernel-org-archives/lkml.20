Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482800;
	b=Tam+rdUDzYtTk5Fv82bk/B+1pOxnKaibl4mRdPkHcpSagUI0l6BIbSbKQEzjvrcIDe2h
	 kTSLQksKbxGt7zbFjbnZNo2YSFHx1iYJ+9AZBQNuDdu1gPOdKqLJeGlC505dlUggJvD41
	 fGLZGBQ1rYkME+7A+uDaLrI9UbTHtdHLQDcydtGc44Q9XnimWk12+wV0sGp5H/7KzL3aD
	 MzSbb1W6hLm1zK6+1U9+RZH4M3g3RLO9dGYxMxgAh5+Mo/mn1ndfV61v9YxMckz2hBiii
	 gBRBKVLV0rSc6cgAz9l+ZGutxWOJ5+N3LYQj7UqVCKTGCKbBKNFMWuyLCd/Z4gV6ITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
	b=xwd7X8Dft4oIHGaT5dU88hmN3xdbQCVUKSeYUpwLFlMbICRS8AhR/Ii6UjrvGAgfX+3c
	 LizhpS1FgwZqYhXjy94B15Qot2AtpzmOI/r/YHcxpghPxhlXBB3nBzosRJbAT/IsYIOwF
	 C9LQU06cStCQ6vxfAf6+zxKXmIy2gD+XjCstr1XnJF3jSeWJqI1aPrxDJCScqiK2JDd/y
	 nQsAA1p2CXldnou0kXB4H5VZdAMFDNx8DnMAnJTObD0dQAvQI5BrUTir7ISV112nJOlEO
	 moT4yoP7ZIT1C29Q1NGTaNHnsWhtuxiTxlzXjykfaW847wPbaC1KAm9YJ5MwV230w4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4RnNged;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTmXBkxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3160A382F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A3160A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4RnNged;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTmXBkxU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9CUtJ4092378
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=; b=A4RnNgedtMnxsh1X
	sZ05vPE7I4lEMorZk2crxxQ9g+9pjjWqsSrNt/XBX1kFDUaOtdRDaw/N/yLvFMlT
	LNP+Pq66uh4PHllKGZJ/khPGQw8YFdgSRap46zvv22TJKGni44ICJ5OrrOFLAirT
	1ri9dcW0p8+f8HjiUeDlg7kI8njYuy77lLB+dEiZlGSu9KQc5NLpLVjUTWFT4cKC
	JrbmRQnQNTjKLSJMmgZ/ALieaEKdfGPY5WJ9upVmsNjzwbWYSNxFoo50r9f9HDA/
	RN/TbfHdZKd3nEJRtQFnNbmfQspONpeCWyUs093Xgc5HMkiyj+nCyNVpfPh2ABAO
	o8HEjQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jjnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2419286eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482799; x=1795087599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=MTmXBkxUbsLO9CbVfsYh3hD2zjHL6yeEc472jeYJMUkAlM6FLEK+6ZNi2Zt8eSvn34
         DPum7+8uSSNNG4u6C7MBsaWdUkWfyj4ltuDAc+yMj8ztVUuTYZ/1PpwTkmyE+NseV6RA
         waiyTqLvMXx7iiCloQl8jiboUSvWwfTAMOBngeesWCtifMPfNiWyYcnXp5oOTMLSlSP0
         T66RoifWiM+HB2jSJ2MgQj3Tq5C5toeSewizsdk8LDFTETDgkd1L+iP2qn7hcVD62TXx
         pQ8rhD4C1WUro6DG8S2OjeVlVgDT5RI33pIu3q7B7lkYoD6JuunJi7t2lJuKHQ/8Mxk0
         NxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482799; x=1795087599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=ONajcRYKUph8YlVUZMBKL2acmLo1IzSmg7tYpQNBmSk9JekkJ5lmJhiucuKMoBRukO
         1uxwk6B6aXyPa58ruAJIn7AwpZZduX5BPH+IXuSEiOfqV+lxAc1Vw18yXxzRQdgJepL2
         We2COoyR8ZwWxLSPEeVkD3NAhkR/+AxaJL54BZB6AJUCWxwkndwlwHghYv4lXhnMQzmV
         BorHw+U3UD1/DZuZwnuGoMoKpOs7zzbvcerVblxuQuRs31KwFLCjaN0R5p0Yo9j/PO1P
         er+2j0Zt3X42sXQeIukrirgB19V9okoaSXApi1f8y0m4HBFRKioNUwGtbav3Qa3G1y4/
         g/5Q==
X-Forwarded-Encrypted: i=1; AL+hErELhSOIoykOqiu+fh0qrzQeGNLW1b88dbK2Cih/26fiFWZcPOEMIPPgaGWK6Xx+vvzR5xASe3Hw+OjLEVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kUxA45en9aHutQiWkP+tOfZ7gcx+VDUvi4paf8L4bIaX7BNd4
	wij50veQxIH/isWBlfJOmdKOO7ZRBXtX9k0Uyn11c6RAXXuGbx3ER7IAr60bTshSxsJL17Btg3c
	AwydJd/VMPW9ECkosmhSEwPPaF8O2j4u5PHcOEQsmdTL3nUrXhuvi0vb+z5w6dbMh7LE=
X-Gm-Gg: AYBFou3KAHz3haqsQZPXR0W33HILVD278y6vWJuwvg7BnJj2QWTgRVUaaF36c9MngDi
	JCa5V+Qa8/3zfIWC8b1CGXZR2tdVjAwie6y6vcHjsOy/84gQBWlF02WchJR35Z543vVxeFA0kWZ
	lBEVzpWggk5n9nV8ALk0O3HjgHyNY16nrv+SyAcvywNwNUMiSu+nqj4KYGEBuiPg1Rh+f8hIlcU
	6sxE4HlzC85nEvV4dhRjf/h2hKlMks+UD9GO0MBrB2sLHPrRWTrFMuk3hFmBGx51Ob4xQpYcZpw
	ErDra7t8C8YXTWqFmNmi8/J8DTiE7srWbzpQK1ljwiy6zvty+D4vATYFoI/BMQ6CI26qMNwm9Bf
	okvENc7RA0vhgWamSY8JPL2+xx9LjOZIKFZiZgjPmLrz/TM0Bvhl7wqQsyXyY2uO3LKD4Fkz3qJ
	G21LUXMrE+mgLzvr6AwhgFiOkI
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016158eec.25.1794482798693;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016127eec.25.1794482798228;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:08 -0800
Subject: [PATCH ath-next v3 09/10] wifi: ath10k: reject scan requests while
 the device is not running
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
Message-Id: <20261112-10k-sdio-crash-v3-9-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1796;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3OlAgrDUFHL3A+JcQy/qTiJndb2c3k6VOquH9i/CJ4c=;
 b=Xhxb4xKzf/WvcXjgs08OLZ5zCxODoNOwrJUny0plJjje3IwaChxj3eE5a7acIetTNb8+f/pFM
 yHZdOEwC+VRDzUOHUg1rO0sqUACq5N/BbJcJ1cPKenS17V7VN8ZzheS
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/g94bHJVrTe4
 eNQBEU4uDOaiSEJZegiNjULRxFO0kN06/TExzJrxisGtr263b2U8Nv23mOLuzNYIF36OxTXFeu6
 izmGtIKInfWcXca1yviPVV9N0yZQt4M=
X-Proofpoint-GUID: V5X2S1BHnTPgfk7SOA3JtDzbmdGxCeim
X-Proofpoint-ORIG-GUID: V5X2S1BHnTPgfk7SOA3JtDzbmdGxCeim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/q1IKb9EYfzg
 UcI4Sbom/yncrz71oG2zJSgHaEHPsQPQc3XrEgNsK3PfmA69FDAeHfboNe6HXYi2UbnGyb0Gto6
 lZ//CQeAwlYd+kX2rZfd7K67ma9uuFfZiejPSl+bGcrcMJQov0wphYVxT5W4HGporHBSXvaHin6
 b6sjKatI/KNzzI8umoP36FP1+shY4X6gqnCAY43Tm/tW3maAixQpeMtp0dI3o4EzRBe9hKLiaxB
 UuWvIbZVxUIWEbdsGMa7jxOvL/y46p3LPdluwyayT6xwyYQCreYTCLV8qh1ttbeETNPUOl0Lnmj
 eoffiW5NJJ4WtrEx6vXNSxWjZZUL2U7UKb5ohD3tfvYjsG6LYZTT4EKUfk0g72zDH0DlQ2XgIz2
 UtZgx+VWcGKvu6PEPIT0smVh7ac9CcoCIDhv9EnWTRjX3OEBp41+UTRTV8Y3PTU2kvUi+4GUj2Q
 V1TS0PCZUf9asDiENSA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5a26f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by ath10k_mac_op_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 50eedc078c12..de466752f988 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6416,6 +6416,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1

