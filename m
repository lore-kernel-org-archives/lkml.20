Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973B4E2F1A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409918; cv=none; b=DcTxZaYRtv/1VFXhmWXPY02C3xYqiqzY0HQSKT9Cj7l1dor5Mp3QRz9hxL5Kw2BnA3B7ogCbedBAmxkYx/9MwoqivHRIwDRV7YD0jGwV2oI1SbebqpbfWV9GnNaFVuNRVNeBFILKcIWIhC8oRxViHGjhZSdEt3FSo6mrTj1bsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409918; c=relaxed/simple;
	bh=QOs3o/03oscCxG01cilEBA+6SNpiI2kfLVpehrEqg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqLrqkXizLQ7WOLy4tUbu6RuJLTuUjEGLhsFz1xqKit708j4lhgQjUIW0SrRth+6/f6y1KAtIuyKmhTBuAN43zEv+SrJED2Fr3VMjy6kVqzltm00Egqo2I6YvBWItIQUFbWt7AyWr2lRYoYY6XgJCIx5OA2Z0+ba9cose5VugJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHQGRQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsYmZ0VC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHQGRQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsYmZ0VC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PDX72193402
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=viCG28a9GrMyDHchBbUccE9n
	1Q9GobJDehgmh2qVkOo=; b=inHQGRQ4nY1ZqOcaxktOu3V6O8YYVWRjNJ0n+99B
	1WBNx16s2n4KqTG+fjvZUpYKd1/SYax5M87hkceZI5HswXLv8qBLlUSIduP4E1JY
	yaCR1uxyGqbjht3Y8o8Fp7Ck83V8zV0mnTK+cjaO1MWw5pNEOXkCySz1k8ySxEvj
	bfbfuVHQm0v219OGpTTk7ZHnG0TkK82PvMB11mB4HeiOdhCNyIfZ4LfdLDJBcsx5
	V5jxtw8cEhPm07BxaN9VdjNnBnh62k0FUZ8C18ee8GjA2z/x81BkjdOAsXpS7HGd
	nSvehQOC3+6N9GjjPwhK681N36Qvo8jHZj/ZB1UlwLWkXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1agt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:38:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so707897085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409914; x=1793014714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=QsYmZ0VCNERu+UBwQ/+ogJkityK98jcKidh9cHld1JxzUSvjgjDwC8yYbme+acqI4y
         l2Yux9BlfNbYJx7OvFt8zPCyrAQr06X/nvDkGYK0c2H8XPQTy404pj9mGkhutVqQ02Qc
         dSTkWyK33DG1JOpSuFRcYmd8yCtUA5b+ODApkk0U8tuMl0/NSPSdxe++cB342n2STSp+
         RXRCaX9D4gHPWfrVC7CszRIB4R2UTyY+q+Khf9pa3UO1cIaQy+G+cJOnc7SuxoWrzduv
         qqJaUv/8ulFVaIhQji7r34e1MlupsqWA1eV+a8+Z7otNDND6KLBh+bpDIE/HyG07vsgA
         27jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409914; x=1793014714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=eiUbh6Q1jLTJR2vi6D1JWPbl9z4/ClyJwxcYaUOHy8hqh2xwwGnY9kYcqdUCfocu9P
         P1qP5IqT7yjMWb1+3PicZufsa/F9GraGmJ6DZC+kvVzt3QX5yWa9GF991J/S6EaYW/eG
         eOH9Oa4g7Fe32Vk/LFwZwqtz7tB2d43KuaxAQCo3JbeQMHMLRFvdY5j05fRzIgO9XDKZ
         0knkoLb3+YzkwH1Wa3liUPQUwA7zTI4hHvLkMSNoTNovttX5IoE9p9kbEuJNapojM5w9
         gG4qrIQn5QO3qgFSKtzKAYc9xBxXZxH+6uCVJSbCvH3FSDrnlvhZgxhSpJ0eVbUymjTa
         RD4w==
X-Forwarded-Encrypted: i=1; AKwUvBzhfQMb0WUX7Yoi6quJRlkNvECGCZ1lMJdy9kHjxwAEqp8i72sSRPFxqf3nRqQLUbZbbzZ9wu8tmjgIj/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/2b8mZU1tDaKt9Jm0rVpDDPvQOqzEAW22Uue71D4IYALE8tTm
	8HD8v90nsBWfbWA2stlP2hdKYbUG5zJJ6hqzz9/eAdQRhOnV8sCNbIDlpqLp75jhLv86ZUG1Lu9
	US0vixG2FVyOrMe5ZpqVHHzqAS+/sH36kT2PaXsC2wH9xhK4+xnaVoMUT32ccEg88EC8=
X-Gm-Gg: AYBFou0gKQtjmjj9YTHKGZ2kREQ5qrdefQ6nMhCRaQj7Ep/5yF9ktbOv2b592sN22BX
	4cuJX1rxSW58N8bo2JGFTy/UOyAv3QvPq6G4F0kTrNSCmVbNp3zQCZ+uIwcb/wsgl6cxIgYLqzu
	YG9Oj5rxhKnk/H3IU6TWuMrCQChPB5/q2tpRHI6VUvnRkzoAxOQTFZMNiUM+Pq89ENGRs++kOwh
	IensbVaBSjdtcNqxeHbsa814xpeXHjNEjIGiMZTGQgJ28UTTCeGzgbF2eDAsjAOhJNenC1miv4Y
	P6Rv/RPbl9/ZKv/ihcMroVttzJ+vonvSIHrmK8S1zS5Ph/ExvKw/a2m9CjZ1jOtk1YaDI85LEI3
	jOqUH3HFqDmsA1x9a
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247868385a.54.1792409914250;
        Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247864285a.54.1792409913562;
        Mon, 19 Oct 2026 04:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm22148555f8f.50.2026.10.19.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:38:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:38:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Message-ID: <v4tz3aztvv5cenofrksn2g3amauzq77sk2cakvqoogqbpbmuud@cwdziqxeccyp>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX0aa0tTV501/u
 ahTEE4ZWwj2C5OulDh6c9nPhAukRdGx74NKHVT2uVjsj+9oFm6+Gg6d0uSsnrplmFzfm1Hp1smD
 beflDu/dUp3pzd1yGTIAfhbSJNllTbM=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad6013b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_C40RPqcRi3kUEhYcr4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX+e3YmuJHc4KO
 rm+EbHplTDvqtWnDTplsTTVnhjcBPe8qcEdK3794t2blqS/LS4/4ST5ZWmd0G6bLEZus4G7oyzc
 DD5O/Q5KYpvFsqdJx1wMrKwjiAkrUFRSa6kBWjA5SfSfOm8MAMesy651TTiAKk41wXOj43miKc6
 /UZybWUEjd3oqDfyBozVGiR2USCxLjiT+0ZCUH2NfuseEOpQcq1dH445B5rt98ES4SiADCTp02c
 OgJb45Zn/c/Kh5tB+ThgYlqVqc941sBSkw0nBWGgzT7/y7SnDCdBwPsTqsM49I0Q6mh4h5OsxWJ
 XVFsB1F7F83New9FX6aG3jHZ66F8fxHrj5yrgaUEVcuxuylhpv1geo8grH/zPKR8xv7QFwjlHiy
 jw94KZ0oHs0/SMc4soz8TC/XP8REP5xqtL9mRXomv44Bp5Wi+5cYyUB/NDZUQYJMJ0lQLhYtLhS
 kyPxSUW9NMJ6DSpdViQ==
X-Proofpoint-ORIG-GUID: FcZJxZ4mjSTFpqMGdvy2DjAIB_VgNxMV
X-Proofpoint-GUID: FcZJxZ4mjSTFpqMGdvy2DjAIB_VgNxMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:04, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
