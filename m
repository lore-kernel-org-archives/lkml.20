Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323908;
	b=rJhaK23X+kZDOw8p+2l2SxXjz6cmbCajfO4RJFLCbWngHXLZbiSNTVKz3+95meyWqU5m
	 cBGgP9moNmxuViKcb9nH8rvU4AshYSimfdmY0MKLVMm/5jZeTLVWkbpT22g3dAjwFU7T4
	 8y/smuiHJ+4ejFMuh1RV2jkKljHpOEGwBrImumK6wlM2RylHyorzVKsZmcB6WTAoAd4ta
	 pX+jqYLp42CHazw5CK8PlqCewhVTYHNrGbqkojL677zgbCHTKo4n5MJiBt1FF4CwC7dW/
	 vOj6eN1xuAZuwUbMgI7GIbhSWOntdvHBpQNDfOPYOSLfIMqL5NxirrH5g2T8HR3lRcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eT/HPf07w7QwH3g6LeLxxNei7FREDLCb8Yqf+D6CtEE=;
	b=ydkvi3fHGzGk1HsDP6/55CJI3TVTo33sBZiHLGdeM0/F8f6awKXV3yQcXt3rynT9sXvS
	 1LEiRiRDBULWFdFrtAfDhGFMW4K+KtWJoRO1SWT0ExvO6UteBS5heg5ZvoTRMhHzYQrfX
	 kNN+84ALl9fSDPs5wpOXZf0EEVk9Q/Ycc0RXidpdBpm55U2XA1Q7AwbGaUw29G4caC1FG
	 NMI4f7MWh453MdjoQfI25IkNTx1QRCS14FSvmeX+QPazwd94rWeIxT0RZ3my5oC9CRa+D
	 XsRT85UssVzIIaFTvmzNtTNg0tQ7JP/83VVsA3l4zJyfiQ6o161OCRaR20hP4RwyyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DLGq/NQq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kw0IcI7K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F04606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLGq/NQq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kw0IcI7K
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TNKYD64163177
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eT/HPf07w7QwH3g6LeLxxNei7FREDLCb8Yqf+D6CtEE=; b=DLGq/NQqm+ANe1oP
	hOsFyI1EfCbDClU5eiUDx02DwlMOYklVeaUL0p4fflp3xg5C6cgermzzE3AlGUpg
	ThY5ILAwlwN3R1wY1ygLCndljrxBwz6vJqxco/+7BIguzxhCSIVKqhc4eiV1p2l2
	Oy6hubxQHmpa9267oxh4+lTZBhcg9qlXv6BtgEZEOgYoBgypA32r4qmzdHEuVjId
	9QLuYLvG8SNIRuFba4tqi3ltjstCSm67bsEm3SU5/xxlfJrIY5CTakM2zvBVijk7
	NkDucJQW8c9KXsXp9hKqtygk8rIC6+kN/4nDQmcimpaN5E/Mcc82q6zmovtsslM6
	KG3tHg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pgm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:31:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so407629eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793323906; x=1793928706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eT/HPf07w7QwH3g6LeLxxNei7FREDLCb8Yqf+D6CtEE=;
        b=kw0IcI7KK+uYPUMUQpwO1kqw48d27sedsAu/ysRRq0nMYM3gB4Kmk7ykwsYdb5LMBw
         XYBArik5J5NCZmWPTYG1VVPO3+IllS4ZWEG9ZZAUxiS3zyIJIaf7YzHP3Lq00zMeYugX
         xV2/7faJTTZmho09/GpKhsp0YY5hJhS95+nseooWASg1YRWRLJEscceOT2DazV9IYqnm
         a9TyNLZtxjECPyocLgL9B64J+XxglkLIhY3noN+9tgjt0+/ozirRdSZ0IE1TEarUn55x
         +KNckOvnIBSE8gIXg2ZW7Z6noiXQ87IjeEuCC1Xakkm18lfNXFtoVvlKBCbBYztdFqt+
         yxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323906; x=1793928706;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eT/HPf07w7QwH3g6LeLxxNei7FREDLCb8Yqf+D6CtEE=;
        b=J3uSZ0tkaYDCDb6/xKi3fohUrkavdrDM6mSdueGJ7pzHDho/RAINtj1eFyS187CeRm
         b5st1HN8i6zBlIOEVC4YGOMG68Yjd7hVCdbbnnad2hPwtScj6l4qG5BpUofqHi0+RcFv
         XSRifa0keCuFhCwIZbGtTK0enNWiZ32oQljC8wL7YHDilO0dEvlGtgy4zBIk08Baqd7e
         FKriU3nKiFW5WmIrFpGL/wUkJKjvv50tXDiq3pCdArbx/6yhUp/yO1jdDQ2ZXou7E7TB
         iI9bRizxMDcwOZ2NcBwNpiYPxQWkAtIKRePwmQlj5u1QEEEaEUe0VwFmvJbWQRMeeZBr
         Tc5g==
X-Forwarded-Encrypted: i=1; AKwUvBz5MrJzzEe5yodXkpFq3qxEVqnux8NmjjvJ3axOme/s/eiVxtFN45EcaK4YvkcCht4n/2ZMMq6rV2pfQRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTwPwAtr+q3V4XLNBUvLg2hWJWVnAxMyYAfOCPH9Ci0HWSjqCX
	O+DWhB25QaLLpXmkUDiIoaP6c1x7fGYzs5oe78DMuHDdxc1r8NNvZEZ2mUkIvtNvmfs1w6bymvA
	Qqrz6SnQ9vMRWVuswn3DEJUmLjwOeu0FbQ9uqxmdy1we5RAKL2YhHyQZsvN3kV8c/+gg=
X-Gm-Gg: AYBFou0roGsf3yR/ACHV8uUUZ5JAJT6iW4mO0pK0K2lHKe89+gPP/Fdk6OEYMFi0kDw
	VvFbf6sCkBHgOKXGC8UMdHOLT9a8FR++co3hJkoNvX2piDp7aLNbq/eDweXxY63APz0nTFP0eff
	VatmdzwluRtOICHXl2aqj4RDR+urNKR8sil/XWhLTxW32cynmgPqL5Ldvt3ZOuFvCaR6BtuL9yv
	uV6HJEo5v2HSoBwTu4YF4vMsDvosELcM5K7oyU7AQvEwH5U3gz29UhN+ft7RaqXYL5d1jLwFVh0
	avQO6XH4Wb1pu5LLAVmtSoZEj7JXOuL1CfL8AIcbXDDw1ExQJjE7HcL03cKbOTTJC+f1k9qln/f
	y99mQUA4fuQhrNWpZKtHEoF/6PjxiGlyrN60wb2hQ1NHog3n5pDavzpUGua9PV9Hkyl0IzlxUR0
	urEYbL9OdW3nnQ+dkQIZ5PxFhVyar4c6E=
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1ac5fd08905mr1066429c88.45.1793323906305;
        Thu, 29 Oct 2026 18:31:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1ac5fd08905mr1066396c88.45.1793323905646;
        Thu, 29 Oct 2026 18:31:45 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm2372200c88.3.2026.10.29.18.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:31:44 -0700 (PDT)
Message-ID: <b60d12eb-dad1-4482-89ca-155dfcb410b9@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 18:31:43 -0700
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
Subject: Re: [PATCH 1/2] mac80211: move static function from header to
 referenced file
To: Omer El Idrissi <omer.e.idrissi@gmail.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
 <20261017155509.128114-2-omer.e.idrissi@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017155509.128114-2-omer.e.idrissi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAwNSBTYWx0ZWRfX92SXzs5cn3qF
 Kgh+88Y9Yz61mr1QB5qn2z/7maVthLX82tvKi0A9jwkz08h4fi4Vhws2qAOiOYGAsqj/kxVUpV9
 mQffvav70FjI96/7fejnztPeLx94xGbt8dEt/+n4LJ1BiDaboCRq59Fnjiq15VXxc7zqhYLL9vG
 I+7ln5FyzoUM/t833JXM5b79nGa3onqd0CjFlzdmV3BtBES9HgS4lTT/pT+cHwlO6EdBj5Utrq0
 V6CnUHf4I0CUl5ss9uUkHxnhU39GSQCYG9P4tzhsZo4Sd3ooN54SlA4tcb+M6z3TG7OOMJmvu8a
 GoUmF9hRd0RiuIMGlMeIvnwadeKh2lx4H791fbt/JxFxe5fZjnadDrUFZZ8iQ2w7HRKynl3GlKs
 Ik0xMnI6XSzMnBXw/pUyuwoxccAAttGMmW5nC+sHpm/fI1ltBy7hDAZn7MLeciCOf2gFrnw3yWq
 kyvZx3A/2mpEyGSpMSw==
X-Proofpoint-ORIG-GUID: 7_ZYcDgM0UozT4MQt_RpUpFsUa0fw3w5
X-Proofpoint-GUID: 7_ZYcDgM0UozT4MQt_RpUpFsUa0fw3w5
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae3f383 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BgYLVidRMrIr9upBI5sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAwNSBTYWx0ZWRfX97gUatbyYX7z
 HgiJ9dJsU8htTvtNZCLzx1owIlmnPzcy6xLkpzuWL3QBvb1K0k8VOQJR31U03VrW4hijVTrMZhs
 wqL9garittYVFhEoVQNS/7BWD0fG8wo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300005

On 10/17/2026 8:55 AM, Omer El Idrissi wrote:
> Move static function from header file to only c file it's used in.

why? all the drv_ inlines are in driver-ops.h

first rule of commit text is to describe the problem you are tying to solve.

don't add unnecessary churn to the wireless code.


