Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579520;
	b=iO1o81R5gnayN479DHi8YPd5fmhhrJZrBuT2mxGAXuCbT5ytv6mPXiXzG65+tp5YZL77
	 ++r8NzIssvQ3T6Mh3GDrIz1xWoNCdSw4sKbdt33QhO8R+YE9KS/l17f7AzpURAd9QFGHN
	 IKNMUou9QfAUwDF88kjTKZwuhzY5bGDTBUVWMSdbkkMUEfiK9J4pEkmgRjPGPrbFEtLu4
	 JA6Ned+Vwqi2GBs5XPa/6Zn3qCQMPFyhB6LsHgUG5WmWQUXUFCr05NmN7sxHYzji1relV
	 xGlYG1v+ERKLCCkZt4K1XRdO2bdsihALu4nkoSo1w2zijvAS3tMZGAFSIwtkdMhz2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
	b=AfW39nP51CBOm+HSeCWIuDriEow9tnpQEi904Fs1GNlrk0HzS35ebe99YwBo0CLktDJ6
	 p820MhlfMqKatbCuX7nElFokLPkldcztDSjknH/gpPnymysqcukLWw6FdfPfB4EZArNHM
	 xRMCAT4uj1iuZvy2EUHZiNjS8PfoLKeRmt1/6MwlzdNM+xIFR4Sf5sPDCAC1fVc85TMzz
	 13Z0SmaI0WnG0Pggp8KHrEojFx6gE5pIJEqRDpGEoDsX79wEeB4f1iqulutaoUPKVZ0mf
	 zEJU1roTlZKGpk7J4qozjPRjOg38U4h2901+hV63A1URTY0uh6VF+VBiQhNunmZSVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCwlGlQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JwFmaC/5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCwlGlQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwFmaC/5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJZ9i1422212
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=; b=pCwlGlQ7TULyLQ0w
	VfK5z2loe6L1KPeaANBAJZ8pkaKWQ8R2PVuIb95CPFVTWpMnlgbuZFhAFcEayBzU
	8y6RRU4LkrO9yQ0jJUjgnqlL8lmmogBlfQxANiRSUvQjx8L/oGT/P6iB9nNCKoZO
	VDpL1BKr44Vm9cOpY2HIi4oRrjm0V3CU727M9m+lnwD0hzK8xRSEmGvXll6pk/JN
	+nf6mCGAG42up6rFCPGROMScRXJJFZX620NOavkNrr2feVs4zeWmnA6dNVLl0Fr5
	/c5sBpV7rozx+TGhL22/jvGviC/C0+yvupb+AwGCXlpeiswkjRYhus/B45mHJ8x/
	qjlBLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug2s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:45:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso9284685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579516; x=1793184316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
        b=JwFmaC/5fa3eA7eujV1BK1TZsGilAlPwSZZSwYINNTbl0OpU++EHRFnbm5+09sKaKS
         WqYmDRcqkY95zZQ6kUGOmy6ZPisubQg8dFsnn9ukq34HQZa3pqMpHsTXhB+lZGxyQEEJ
         GTCu3VQzgvjHOlEAAUTb1YQC39T5zQM6/Kuqgy/EkeswZsMTT5R+F3BnciGisfnGcQ9o
         WjS6Sh/mRXPk0MCIPfGlgJNn6IuCJpwBpcn6cFs55SSAzJm4rHQ9clLsCzaFG1MbC5Dg
         rz2y7l6/lqbWtHDWgHIY7imIXPghTdArpthErzSDRdxZWMxx0F2GolW6F6cveItUvEIi
         iwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579516; x=1793184316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
        b=mGr2pRwaBnLOw3JVWudDeej6w+E20cTu8LAhNANjyLYgcsryBPDe7ypSaIdELUlCk/
         xTSL1id+CdqS3ciawPRlWAmE++6PxC9/o7pt8mGcqOUeLsvNnVsFESbk4VUFPfUaLe7J
         P54ZbbPVevjVO4fPFwQinIQYzR8KHW4XwTos17uANKAdlHUidltzuTwH/NymF45zZPtO
         4LDqGaXc9Hd8Bqa5I2HFe2x3UkgdZDRhU5QSOTW+ExmT7muar/uWLh9VTtwQ7bZik6Oi
         +viTBcJffLqwiec9kACMo8eGz7lfbT4EJ8/NLtiEoRifA4jwlVHEPr3cYgauS1tGbTQv
         T1cA==
X-Forwarded-Encrypted: i=1; AKwUvBwuvnZ54Gz+giOkJl1bODLgx+YFDc4v1B0fImDAy94Ac9YidfCUOtiNudTMZKL0XS/c4qj3OJc+QmIfJGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLWtjKjO6M52pTpoD8eEW7W5c6WlOvJ6G/zNS0tZ0sMoF7z2ri
	pRVVcSawPGMCBLOP5f6vj3Nh2Mlw2fatOTWl33v3SaIDom1DMmjDkDWcXYpphIx97LbxKVsQ47K
	+OLETvKeYroZp984bq04s1QhsdCEd26re9cgBbCkey8CJJMaTdri0ZC2YduKeqAaGOMM=
X-Gm-Gg: AYBFou3DYd9z0ro+ncAuQ8lGqPGaLM3Z/Qk+dF+k5CZVXa+6Ki7TDCvH0WCz10UbNG1
	k1v3+PW71k89SfPiM5z24niYqzbbUi2UCOiXhUAoRYkYxjtg0Y/TcC1vwjAwYdYt/DFIE36YTrX
	QXmKFuYo59KAkuFk9/JmvNuOrRe+h3rgid+pCUXMIgu5RZn7Wh+hpowIHMzmE/pnv2HkNjnmidW
	jqT2Ja6e6dYckv7yyWXKiDWROP7xVEIBsRZEADQrI3OAq9ZRdP+7eyTX3sqg0YXpEY+GbtLBwcC
	BlCtEiW8eVCTYoFmxXJDN7NKhCk6h0JO7mxVKuF+YQj9TC6DoB6BtxT28Kc5s/IRUy/XSkxFBBq
	cZuFISvCK3wj8xnurY50DDA==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr398740585a.0.1792579516631;
        Wed, 21 Oct 2026 03:45:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr398737085a.0.1792579516230;
        Wed, 21 Oct 2026 03:45:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm741643a12.13.2026.10.21.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:45:15 -0700 (PDT)
Message-ID: <4c3f41c8-6974-491b-97dc-3557c0ba0c28@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:45:11 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] i2c: qcom-cci: Add burst write support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-4-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-4-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad897bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX8pNYWty1+ljj
 8dXsZRkeYWKF8nhPNsgNLUHp0ZfdsGgQYzenisVq7jqGlmuT/Sk79jXc6w9AKQwIkFji8ESLl0o
 vILdb6jDNMjb8XPoaCFqba2CtYxmow0=
X-Proofpoint-GUID: U1Agh_L7GzC90JSkbuZGEzw7rv3xeDZQ
X-Proofpoint-ORIG-GUID: U1Agh_L7GzC90JSkbuZGEzw7rv3xeDZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXx8IndUd3Iddk
 296erXp+38NVgn9zWLu0Qpz+ViEZ4UcviPdtWQcjInY8QfmIdu8dsrh9iSHZTMU8c90HCz8J/kv
 qQ2t2+kVdLgHpIlD/KPJZEerw4ANVvjnz9WtJw5+DlJbjfbVjPWtQXLh9LB2h/1hSWSQQTLPNDW
 RvDm7Hv6ntIQjNE6UNV/3mf77UvZrN+CXjOxve3TGlVl0HN5AMTEI8DM5F6+NXEQRtD+OYAoQwE
 OIfdGF/sDhTT4VbmCvfq+cQec2ZjrJVmAIr1Vbai2Wesbt7oNLQ4jy/yoUl7bSeOdd0AwWgI1oc
 QC2bmsU9jhD7/196iEKvzL3xRQJsvfXjrUaRD1tyRadBrYgj6PO1XL8opjTyagSS+FJfcWPcC6l
 tqvnCG9afuC6KOfMFlAQ/oSFb4CcJ0McUv72/JVGMX409Rh9cs+vPnnqC1py3ruDfeecq56KFah
 tFKSmaJG4plmNpHCkmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> A single CCI_I2C_WRITE command can only carry up to 11 bytes,
> so every i2c write was capped at that size via i2c max_write
> quirk.
> 
> CCI v1.2 introduces burst mode support, where consecutive
> write commands (marked as burst) run back-to-back as a single
> transfer.
> 
> Use this in cci_i2c_write() to allow longer writes across the
> whole queue instead of a single command's payload, and raise
> max_write_len accordingly for every CCI revision that supports
> burst mode.
> 
> unlock/lock commands are required to ensure the commands for
> a given transfer are executed atomically.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
