Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29F478E27
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261293; cv=none; b=kus5kj+zBDpBiNCqMIiID4btoyH8/OcBnPn+jLn8WDguvr+zHd+Jq5iVF3TdItV/KW4fRdD8OC4B/mPO1F3HXkjnNHTGjga6S1SRHD1+nYuzwU1MxOets9WRuMI7hwxMKxI/hem3dNoRtfBmt7UgK6gtsnEKIrTVV4R9gOrSCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261293; c=relaxed/simple;
	bh=ViR2iGgb2rl/bfDR/Xx0sjUdrUTgmjM1SnhCw1nK+d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMTKckBvy7438LVBqGaNPUCLrrlqYszOzxFRj0Vx/GaIvVhp/aloUc7NeE22hmsALCShsQN306DZKnosBjsptxdmH8QHIF3QNgC/a0Yvm87blRrIzz7f2AlKLsEYBvlGDpaKyTF2eQMvHo4HXYAEGJIhcvbTpdc4WZB2VCwQoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6or1dGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKgpdEOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6or1dGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKgpdEOx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJjmp2752209
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=; b=Q6or1dGNuI2kUo7I
	fVLlnSIUmQSZt/M15nBanTedSVD86vAtijhoHcqDapllWXZRi5HQKLpL3aRDG3J/
	GgVlVEEf8IS3VhJPTs1B8361yhflSvGFq9tGs8goRLWt0R4Mar4pTGvTfKxNCaW4
	v5yJxnetzcQWzRwyqee+k9vm3zsWwWnYBufVrUKfYwB45X3v0mRoP+jQUFdNvtP5
	ERTLfC4NTKzgI2HSPeuIXjdphf42Wp9xDy03huBVsO1iRV5mudS2YdlllTOpOZu/
	MLYXrlE/Y1kIAAJlxIJqvLG1iIraJenfKYA8CLZiJdYQ6rlDlbS2i6QRGNcGWxIU
	8JSwGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbmfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:14:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so76223285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261289; x=1788866089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=WKgpdEOxtF4YZ8S51JykkYypkNv7Rvh4p1n0y5m4wTG/li/LuEPmIyav68kE1VtAOm
         jtDKsxYtgmUDhGxP+aNrZ0lsObY9TfzIRs5w8pa8igQfpXYxZUhD8hZgmn4egnnlv3NZ
         QHirhxeXR+m4cEvCK90FMUe2npKLAEYXGCZBKE3Kvmz4uWGH6HCwUMEwT9nO5DeamVW9
         rTygXRWo1cr53KrAUNJopzpiucur0gfr+Npu98S3evSnI1XUo6OM+u762nYflG/LgbdY
         lTcs9Jbb26bcN0SISqPJP0hCH6T3UK/qTfQsIRQk4uULhwDDtcy33Y2EAPpbFhwaH0n2
         h1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261290; x=1788866090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=EWJugIBbKk1KrME6AONwXKUAXcqjqPEJRtgrgwmNz5kap8WkDQSLeBHxU7jo4rjeBa
         A6imBfwMb526zVPZa9e6YUN62Qe4+AuF2zYfmjc/t9nRdwolp0fSnc9bdbqQDaEvuSaK
         YJDOITbZ88NUYQTIXW7Pcn8RQOdBBP1vN1t6+YILjC/QzVcwrmbCMSNcparVdengKIf4
         p/UR/uJFMU67S5NC8ulF17N5l+QXjRN9QJo+PSjeOuKsymO/vc/7oePtxUkmP4tW3umh
         hDzFKkRCXPVToyuipN5odiRVSWHn9g9tiSTI8sI0yPi0/M/scO3It22fvr6AmPcp6K2/
         BUtA==
X-Forwarded-Encrypted: i=1; AHgh+RraL50dm+gAdfhEBuKoZSoWS8u5W1G8W4et3uE6xam1o75gB5wU6DBB/erMuacrCi9+BmsKeJp60xy4RZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmVfVuY4owWdLPrTToim7uYPVx1WAcSjea3p7r/fdvF0pCtrRb
	e7PJFcos3CmlRERYVJN9sXXbBzvbE/zChVL4Y49EGliw3MDZzHK9A8mKhWSU2tVah1FrgICDhsn
	ZhRPVpZJs+oA5tXyWGoXdhSteI2aW5h5iwsNvBoShUXHtbnVBLLc00yRmPXxN4vYrnBE=
X-Gm-Gg: AR+sD12jO+M2TxsbvLdTayV7gNC0bVLrm2C5kv9+pthx5FwbbQa1IpSchGznYaAfFdX
	gvfposjEGrYQSHdJDdQrgJWsi9Iyit1RhLBRhLYVFRkZ7LemG02iv5CxhTSpyjVIJB/aZb08Qh5
	E5LcOBinHe9toiIe6DwzV5Hg4UT3EDmTawB1PFfQYa9XhM50gI6OnBcJcNRnYkLpv0UuhSHWUEy
	qmcpVvEZDySLw4EymUM8J2MomolyYd/c1MLo948pT0gGl3Gahh7r20VF3i8FJ6DmyuwaKjUzPkd
	ximY9AKBQVxFEU57n6jszXgrw+GdhRoe0+2g7h6wvJOkWojehG32bCzU5XVpRlWcZ2pEwFoMEI9
	T0i/9879kzLG909I3fbHpxg==
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267541185a.3.1788261289659;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267537685a.3.1788261289181;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2049sm582370066b.36.2026.09.01.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Message-ID: <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RW0O6tMRG8VIH8nPSkZy47WstoYdFhIG
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96b3aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Cuw6cLIPfeE9647f4vcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: RW0O6tMRG8VIH8nPSkZy47WstoYdFhIG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX/nzX/o/n341x
 zb2Kr7Q0+lrO2UCXEk04XyspawQksmFml4oUnsBb9qZ/Rbha5cyIS3k1HsGDCZJY2ApSMTxJkCX
 xi+YW1AxZg+IC9Q4mj20YWnTAhWpfW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX53kg0iuzzlLq
 VkFiVyO6vlnzkoOiW+edBZ0hjH64FWJSKKT8q3pWsUqxnc8PHz+llr0oJKsmQElyCZCDPyeXFKt
 CVLltQef9yxnpu+oR3RZIs9i2rEWCwJCPH9NhQ1Ai2upGP7vn0djRlhf4C7SydIL/BB7fK4y4xi
 /ct8a7HI/6+YRkl+sLiccX2KVtcdjCabVlYrqIM8Xy5ax8bUGfShynWex21UcWNGezYSSZHO75i
 Q4IsGqxxWWcMUVhNun/X7eFPNZz3RYnU77bEBP15Adng4kThJKEEIAKDa/dIhHb1Z3JOC2H2DMw
 UE/tMgEX2ZiJc/n0UY3mvUDoRyR4ZL0FxXdVldScD0wwnwJ2SrJugFaN1zRBBVjTnJa45AuGu+n
 pRfeqP/8offRQOon8RB+6BBobV8/Xtwq5FoNcUiVqwfJ2rGxSm5G/AWPreps5LKAqi+BFb493bp
 7vSsHeEUSfGMPDrssQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099

On 9/1/26 10:22 AM, Abel Vesa wrote:
> Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Either "Adreno 722" or "A722"

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

