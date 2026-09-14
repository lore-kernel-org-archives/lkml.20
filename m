Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5B3FADFD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371732; cv=none; b=RytmJg+k2rzfty6ryzZ0z7toYa5sGpHMMdVnQBpoKSuQg6XTWrd4mIl586ieVKUR1w20UCHrdmLWZ/wvSpgc6IaZr/2VMLGo66kPRF9iNAI+JwRz9ZOhcXgs7XSkNpgRLMSUyy77k+cQuWPTXZV0C2vCeXRKoGsI7y29AGniaSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371732; c=relaxed/simple;
	bh=9dVBNK9W+CBPCLmmp3NOmV0wGLXOczzNZNj5nKU42Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqE+UByhhnRNsxpVd67+ORakyJ+SEHPMmugd5WYDiFH6PaCrCn2ehAQFx4v+oBRVxXehgb1cjXTbVW7wieiiejeU/Eq4tEXDynVokocmZ8+WzdPSwTifQjatTH3JaPrV6TPrz45vYAKkytxa7ozRSIOWcbABTBRwOXgXc//M31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkROjClV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWfPW2VY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkROjClV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWfPW2VY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilji2626996
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RxHDRPQG5GapNsDYLOilk50
	BfaWg++uWdw5jiML02w=; b=bkROjClVznLYfz8iLdU/kt6duMSx+31RKIq+PWIZ
	h9G4ftJejB5gZ31ZsYe6ph7EezRESNiUKiX7yL8TmyqAIsZaK8mxMAe7/t4ksbiO
	oLyy9DU4hMaxXP0TLt+CFO08LgCUC+Wi+i7VfBlglY1h1X98YAy4exK7Uqh+4Sgb
	bCJsAOzarMOuk3TAOme4s9caq7Ges2wSVUd5JxtyPOkZKdd2D99LmHU39Q7asHIn
	YkglleKiJ1jziGnoHAkV108YIeWiAK/YHqEXaNx4/qq60BrKYixPy+qlqYAnKpei
	+6IDkHS0WCyUbvmccI+/3JvmUV7P5AE+4rrFffwt6S4s2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5e50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so596801285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371730; x=1789976530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=VWfPW2VYgQZxpboUUPgot2GG/Xp52/N8fRudVypVBXcejQpWpdmqFjkPGicWBRCIAK
         0k4eSROyvrRk8sroluu26rgeGnNAS53xMPEY987vNn/yiGItMyCTUd8WaN9kdyF/O9sV
         OsC/XIBMar0oA5tZ/NT/g7ly+iYnY7EqfqHIPTFSXXWGawU5u6CKovIUktih8Ak2b9Vk
         NfY1YGQcgJwyLu82dVn+MWoS/fJWlvGBZHpfom8bYLGfRB+uggubTb185dqKHtzVcfdP
         Dce3ofi8GBZ8CQO5P1yfsRXj5UapWaMB8BhBqdeUSgLuco1tFTqG6gNIgFY0AxsfDC0/
         dEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371730; x=1789976530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RxHDRPQG5GapNsDYLOilk50BfaWg++uWdw5jiML02w=;
        b=hg3jSUkd82n2ShZOdAfkVfF21Ai4dFTOguF8OUJx2DeclR2JjgfSpiVPYxLx04BVVw
         Omgedttm9Iftapm948IiSUMUZvVg4wPszdN2pJdjrYfSamKBq5Qyo2RsaKjWtL4FaWkb
         a4bQEt5/3nOVmmAYv03jZucAUIVoJEA5n8iMPBs+AfkF0twXNQajLFGf3mRpU0UJ37iK
         8lirCyNN79P3PXEVUibUn3ZtTmb8J6Kk7i31VT5BkySpG/eT73owUEoyuQiMYYEB12Gy
         FlmB8weIWOZzryCpwKzAMUtyJDH3lR4wAqgX20OUsKIcxTPhK6aRoRaCz2xpIR19HXMY
         W+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwLozN/yEkOYmKT9oLR0cPdNmPRKcHpT2uhSQGWP/E19yiHdxFWiqqcwqCkTJQhZydkCot6gZz72tayF0=@vger.kernel.org
X-Gm-Message-State: AFuF++muk/an5pSckVhuZvyTwsWw5sVGdLydO4qr4YdDJhJ6K7LGXMCG
	E8Gqq1/aH/1ih8SDs+U8XgUf1aILlSSCcPLxpI++eCv5xeJPr10CTqJfwtHzyFiuWd0yFa8Y4PP
	VvjQ+mGmZSAhczCnH6/zkBhrycmq5Y/FQreLKAGpQgQPw5jyMVllAxoQIbXzXb4HBK0w=
X-Gm-Gg: AYBFou16jtJqdawKkwYZ5DeVWqeUic8YupbMYac8iZq19Dqirke7gHlwJcMoXq9YvCz
	IhfnuodJQ/GAJo6brBzW4XAC3v15SpwUj+426cXjJCXg4h8gJM712WZ325LFxMqOzU4WI5l8ZI3
	oOTtiakUdfA1qYuorkwNBAkzsXRoWOHeQRkkNgcqw87goLnc0yZcT2s+cfA9Y2jZuZi7aW9zmJP
	R8hA1fgjg5k69MpwYegzw6WwCrbvlOtVk5geqwNxuae607N2srTp4tqRhvPGyIuwVbB0NKRbC1r
	AswSRCApzQDAjxuUliPDq0Qjw7q9d+p15QiACHTQHd3lP9rD8kzcBxIkR+mlKWFtu94HOhlo2GM
	MNsuYn+fP+Gd0AQ==
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535342385a.12.1789371729660;
        Mon, 14 Sep 2026 00:42:09 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr535339085a.12.1789371729125;
        Mon, 14 Sep 2026 00:42:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62232cb7sm230063755e9.4.2026.09.14.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
Message-ID: <tpu3ocpkqxoyur27iwrrpjnrrn6goia2j5uflhhu4qbbjp4dsc@lwsl7lo7eti7>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: f4p5UI9IOV-iXTC83Sm7jVixwI2EA0Aj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9IGsPz+8QTiJ
 6KF6S+9hNj9zBUbyzjMICP/3IRn4dF2D+oDscSSIHOFSfqr5CuEu9Axb9hpeoWQHWLfxRq1LjIw
 FcWp/mPE/JVzHwSECCpTh542E/niw+YxAYbHoGZxtWOsQxfyFF7ix6PnTatrQRmdEsbxh+r3ADr
 dQ8qx3lkesyX2eHzT5cuuaqXaU6yMC4M9G3+rZBFn0DGFNuoSXOsxoJkj4FCo8gMeAUB9CNPvuV
 v+n/R0L9Gdm+NPyFOhQ/JDvA/NcPMHF/k6dXaUf+DJ+vGTRpeByntceMB5a1G4Kw6aEGa0dK1mu
 ojMPzHRQIhUQ8azRaafcO86xyC1zhqNDYZBsGZpbDaMedXPAYBGZVLcJMfCZol81mX57bemn9gP
 JhBF1RzFfKjEv+9dL/ZxVqjOnIRJkxsM+Ac9E4nONMAoVGFpGRly9Bh6dzdTBwABhqpJXwY/lJp
 x7nOpnrS7cTS39IeqzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3iD73sfoqtL1
 akZo7Ho8W8M8zWLNUgaqwqw+Pmk6PY/bBrn81OXXC3BNKMG5jBJCAgxOj7QW5t6qEeUHAe9anIo
 45BLZg8Gt4upOD2nmKTcF1Z+DnzZmmA=
X-Proofpoint-ORIG-GUID: f4p5UI9IOV-iXTC83Sm7jVixwI2EA0Aj
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7a552 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:56, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
