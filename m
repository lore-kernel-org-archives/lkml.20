Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739654;
	b=zwKPzyYg6Lmq5KG3CDRkJYS8EWBP88/2hXhmy2pY/eGvmBrj1gfsa6RZHbyYaT+oRhsX
	 13kU5VNr9bVq2lOv3cpdixvXxHMd2nchM74QOFqgQIF/W3Xac+d3nQPyxRkdtSssh2Ije
	 A/GaS99XdwpDNot1asZ8o82CSaE1HJfIhH+K9YuWIgKPPS6U0JDcQk76RKwX4sXRjoqdm
	 ZqAYHSADqhrsxO4zun0cLpJid7bzBKW7JoVyT3yxS1YTIDFZId9tY/nwthopXOPEjwrwn
	 7zjoP993HqLQQFNTnT40QawAVMO/sG6KtynT3+OBfHpB9l6Las3jm0EL4hbZ0TfVvWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
	b=Ufzm0gTDJrC3I8q5u/He9WeHUd7VyBY5MD7cEpuW3T30Xp2WP22yAX5yPyG3WCTixGvk
	 8osVcYMmfvi7gOHA6dExcGQlf6xMYCUY+rG+wYP1sDWGefAjYyRQPLPT9BJZ6G878PmvD
	 k/AWOC0T109nWkM+CL7rYJICpvXU2dKNnLr3mH2MtT8zl82uY+BnaeZiHTlwBKR19G066
	 UbfHL896dCNwyiDqv1uPvApi+Uof6TRcAMe2Z9ex9cFEVCXbuECtKGbA4ivAyMypqb9I3
	 b++Ss3jjlrY0WCZmsKHmVYeE7sHChiJi150xzvG8Zx5AsCVkX7d9Bl3R3i82TZH4E9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQDZ6Ikd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9E+gh9W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF634606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF634606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQDZ6Ikd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9E+gh9W
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ55Y3676066
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=; b=DQDZ6IkdTD4TfR4h
	QABB8e7VWCWMVOZKatz5cG2ZupT8OhMFcFFMfNvjLbnU2huxsEnt9PzMbYcmwcKM
	rcXOmWW9SJO1ALJ4CZePlEKys80gzfsq2L2grwlmh8AUlKdVFXWJir5s4L6f0XDE
	EUukTfuK7BC61i0YYggix5dQibhKnM6eZNfv4Vu/fgiZ+J2DUHawdtOILn+DByLj
	UzT2IVNmZdakkqpm6UABaWZwMTxa+cmy0E4TEJNLcGvFrCN1x/YAsGJSh/3sOklz
	6liZgZJpwvdrivGuzDimPxa0mduchuvgSs0uBLsNzGIkFNKmnm4941/e76DqSYCO
	k87QCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyphm09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:00:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so17661169eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793739646; x=1794344446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
        b=g9E+gh9WOr1y+hZ6ZkhOEwDoltB1mXoy48+bWDVg4Kp+hdmwP7XL3bxvAhNQIyDtkc
         sP0CnnJ9P5krTnb3PWknKl7VpjEn1Ts5jY+iuT0MuMDnqubIeQmeVhReXetxOB/PDXHg
         KN2V+uQq3RWujTy3qfpM2brSEzC9mWGp2nBkHchaXgSlZrwq16RDpACMGdBNo7DjyXtf
         dP9FVy0hi2rahnzDy9VoopWqMvVchUK7N106prWd/tQmusB/Zhugomy98bZMNhKQqp46
         NeXMNiW8zr3hXSAgjTpBbwlKuef4L/DemYPHk454Szw4DJXBlvjEVyfp7Z2wwhlGJePp
         8WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739646; x=1794344446;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+TGSDQ9SyPrcH/PQA7dWzaDsqGof4ZchVSIqxBGMHE=;
        b=PADDAPAxD7orjkogAwt+JZtDGrxTuaf2+LT6Z25PyckcqHtMCuEOiw522yWDGPfv9c
         AxKfJP7hHNSb3lyr7HF48QyK3YuXQ99jJPWqVZaIyp5Hb3ez0iYkRwVxXXpBdKuRcyai
         HngV2hnYN9GuYM8B27/6QOCvQ/UwpEkTampT2lGpJRbR0+ovMxPMgASnIwlZlAr5cEnL
         hkGyFzbWEjHfWTOTgNk8SyO6LX03kPsXDpRwpt5JrUAyPK1C+KS6imRkrHrV5i4kplT0
         3Hwtr12G9auuGSGzN2p4OAfkSdXmSr9930KqvOmhLBPnAmvmz/pQ9a6D7SWIyTtj3Ni4
         rrDw==
X-Forwarded-Encrypted: i=1; AKwUvBxi8uJ0LF6ifdFrZ2vIARjZ1vzKad6gVdgZx0n0QTqmhBu80VXcgU+QvhcpWpvISCbkC3R/J1C9tU3gS9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m97Wlzoa4+bNogwv8XKe2ZtkVQtAIUxQTHU3E3qMdIg9a9F9h
	HntL0HYHSPZlxQsUk2KF3F+e6TyFXcPfyjPnXmGFntXI6jXS1Id0Oyxy4staeaLcaJqXzL0T2jN
	AK2TraNszMqmC9KBMzqjrn84fgEpxJy2FSGy49qKWY8PWRhpAHzUeMA6adeTvdiZXxHo=
X-Gm-Gg: AYBFou0tHFW/zyUj4RceenR4AcF2UXXbtTlGNTnOx5lx0ffBKgCMYqYspWjFDCL2y3D
	6zcNWu/DgRu3awycPqViHT/VabXFDKOT/om4A0IJt2ymxQ+amXC5PiYNQf0ZU2kqSzvW+pcMIdA
	Ny958nu9duprnQ7KQCcmOzWWJGviww0hVBbCWZ2V60hXoGw7tcA9mJhcoiYkfljxltXFBhN704C
	tPvI4tJ1TJfnc9yDUvPOUX7UAq1CAQXZiPmXJiiSMe2RRleNh28NLR6DSUk/25kah9YvtGCFCfk
	+wVZfCnnDwtM0E4wUTToUeatTVWTYC7nEUMRCmD3FuhbXWaU689wckoHtpBXXvTgCZVKS/vg0fF
	4l72SFxYjC6BqVRg8jpSi4EpFyVrmW4r1MHnivA0QjmirfSdREvCkEuxE658aLnJj1Ko1T1gb3l
	zQDR+ljcZPc9sTZAEVluChdlcr0g==
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr23432950eec.16.1793739645625;
        Tue, 03 Nov 2026 13:00:45 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr23432898eec.16.1793739644957;
        Tue, 03 Nov 2026 13:00:44 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm706469eec.24.2026.11.03.13.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:00:44 -0800 (PST)
Date: Tue, 3 Nov 2026 13:00:38 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
        "Rafael
 J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai
 Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Dan Williams
 <djbw@kernel.org>, Terry Bowman <terry.bowman@amd.com>,
        Ard Biesheuvel
 <ardb@kernel.org>,
        Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/6] cper: add Memory Error Section 2 structures
Message-ID: <20261103130038.00000f77@oss.qualcomm.com>
In-Reply-To: <aunhE1aeSfk6YDgj@gmail.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
	<20261019203915.2019037-3-pierre.gondois@arm.com>
	<aunhE1aeSfk6YDgj@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX/Ackvn0jwAxx
 YECfhbrKMKw65oAcrjfYDH7Xix7E9wwJ5fHmGq0lnV7XcRnu0lR9s3s7iLGhegoE+lCFf01XQMT
 ghSgUHXOt1m4CUqLtPyGYvoiFF4fPgo=
X-Proofpoint-ORIG-GUID: v2vHs9yVs9-fHJCvtvRwFDVj5DyLR6qa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MyBTYWx0ZWRfX9DyMz03LcnGQ
 TEnwm5SdR+rkNuTbCMVewx90eYz0OU+k0Cnn6ABjeCd/rFrHEnjRL178YDMVaDDcr84Qr13QyZ3
 shUbqnPJCFvEsZ/oCwLnpX7WKT1LWktwwoXJ7tkzoIeSLC9MAm/8eQ9PeH3K0xQCMxwwuFEmJ9P
 xAf1LwGu65UNlHmbR1mnwXWyw9RuMOUf2zkNgYdIZII4P50xANanP9BbxGeezpxZSHYabPvBRcv
 EXXi7aEQS7UI9zmze50xATgqeqOCdfg3zCS+Lgrbt+pCdwF7Qun+0brvnrSZfbcLv5RAwARPeKU
 8Xk5gZe1v+9AVURxYUNLoGFbrstLzZca8NE1kO0z5rYv1u0D6i07P5SjdjiuDQYWwiXynkhkfQx
 HXvUQTHAYBsHjKFmrh5sfbvzKyFoyVUakmaUDDuMIlcGXa1SfTx+v0MvIll+Omxb8Cj8bkeLyDW
 WY7r6C/eJxMivU2kJwg==
X-Proofpoint-GUID: v2vHs9yVs9-fHJCvtvRwFDVj5DyLR6qa
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea4b7e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=bZ_CbDB1LfDrNmofISYA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030083

On Tue, 3 Nov 2026 05:27:02 -0800
Breno Leitao <leitao@debian.org> wrote:

> On Mon, Oct 19, 2026 at 10:38:41PM +0200, Pierre Gondois wrote:
> > Add CPER Memory Error Section 2 definitions to the CPER headers.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>  
> 
> Reviewd-by: Breno Leitao <leitao@debian.org>
Typo.  Just in case Pierre is using b4 or other automation!


