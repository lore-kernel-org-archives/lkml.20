Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4988445A284
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779083; cv=none; b=BLyW7MUjXakcvea+Tjma/0fk1dxK/hIbUOEBpGx8nFTSQsGGhBQSc0ewlX2UAdKEom1dPx7EzsR4mjWsokdm9gewkdW+jxAb9Fq6G5BFptD1B6XBI2VJVyI3H5TWM31lADwQy52C58rou1rAtu9XhJbGZy5uMlPxG64MHMvgL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779083; c=relaxed/simple;
	bh=tppnW44Ocj+acAJ2dD1nPV4XSU0+k0sjFpaphZfCUGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN5fJ+BKzln5mXe/q8pYbhP5vP5h56cs/uBJaqPcovK4A5lZgqiRZGYH9aQ+Tb9pNThjBAObmNwQBNcIKaXrif0tp6hoKWoXZYC8Sad98wnmLFVY+vBOmhm6udKwJM9f2zqbGlqtAbtM7I0zJGnLotp+PxhKUqfIMNh3/m5gKQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EchScAN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpFSWX7P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EchScAN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpFSWX7P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnUuX4064632
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jby+wtgNIbeP+wmSs4RZvdzQ
	ZYGPorTrd8LiPB3HBio=; b=EchScAN4CwgZrSHKEjMto6xGu7hUPS35VA8Ctzih
	ys0LkRSP1b3gFtYJUsxJ4PCd+0VCT1Mp/2txP2zP92Fgfcqf4yTuoV+P7eEwExr4
	bwe8nj0UppaYiLU3bgEmxRqenCrWxkNgacHwDVuwQfELsW/Xt2258/JeOqoOwv6T
	Qsy3+jMeggKMwWNemp4tjydbm6BCyy0D60aj5oIJ8aRLezh5Cc0ox8Xei+pQvZ1u
	/+Ej07FQhhNtk44nFsl8dg5LSVBuBgCQkfygkMi5KqG26n8cjwFsIxEl8KOrIPir
	hrdrrSpSbdym0wPtc7Rxs8RVhVfUkoLSu8mxPu7XSW2n0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rv3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:04:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so69429605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779080; x=1789383880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jby+wtgNIbeP+wmSs4RZvdzQZYGPorTrd8LiPB3HBio=;
        b=fpFSWX7P4L/rv0axsLvS1COda1WSUG6fq5QHeqTZXMdN8nr8MRgiKt2cmZL2KvZTE7
         TqbDZcXs2QFeCSMBhy4C4mi7tRRBY/Rek/1Xr/NoX2zuSyp1SbvD9L6oJApM9HbdtKCm
         0I7EPpr2i4+0Ruxkvik2DZ+BzTAYsqqAerTHbOzEALTucq+SJFXtdkxqC7nrxUYfTLPp
         HpANYNIKhmvzg6aIN6IpmXa8+MooaHSwiWXlRlTCKpeopGgGi2DuUPbiyQcrfDucjqRo
         x0RicVM5Yyotq+UaW30LfGw+aGkZhhKk+GoMVQUoKrNAnXSdywRVmnBUDXnI0jWIt2Ee
         mEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779080; x=1789383880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jby+wtgNIbeP+wmSs4RZvdzQZYGPorTrd8LiPB3HBio=;
        b=na81YoLbCWVZzeB8Brn9u/zU2KGQSs/P12oEjVOsMdkh/+I84LWJVv42Y4ZphbiTQw
         HuJqQ4opAzFnzhZ0KTjxCHC6DAVPvPlpQFPuRkZfDDYePKnZt8WtJiRrsTRUi2XZ1bYc
         FXpx3rGzZHhfnvy4zJmesIMP3SZNpomG8F86HXuxOO1lRg/QGseR8gDuA653FChOFVWP
         SfbmVxaouD3lCzPXb65eWjdp9xHS5h0hBcTs9j4RZDbHJWteAT6cRz7k7dx6ntdx+OsJ
         PQvcUPKvSYB6NJsnI9fj25zYw7ebUnf0RRI++gjsR7PiRbqQg2d/0SHXcbWewPpuWVkl
         7hhg==
X-Forwarded-Encrypted: i=1; AKwUvBxU30/sWMROuMzw5KV+7DA9t7o2f/TrYvWZvRwKX6NTrETqEztWtfeCBo6X/T0GGlx1KZ2I9RuOMmq0tb8=@vger.kernel.org
X-Gm-Message-State: AFuF++nmlWMk6iz2ZPlHVNf3r+fjiCB82njJxJPtyy/zIy6JrELW2ATZ
	c/DnEqPEVCMYagj0YFQOnbqqetdXnXbyVG7pvxnsjs9g0dudyf+bbnEFo6WfaehBzfKo0G6LuR9
	Vgh6pUc/h+3/1mofHDFDjmFuvPJhQqEdpt+XtWSGW2kq1QZebkreBBXlOcOHwv4HasEs=
X-Gm-Gg: AYBFou2cjM6PY2TkwXp4PvmTilaxoqgCxEA4h6PBDWfQsR05HaIqXFJh4EXj8s3D4Mm
	bDkLvE5DOkg75lyc3uII5TaNzO8xJ/DIYvec3z2rjSHvQeA9kqabInqY1XdCeelwKPOpTOsduS7
	MldixwPnvWwv0YGJG/+95DOBA6KPB3YzAiax1QbVlp+CtIq+/3Yy/iRmsb6K7xj1+6lWNFNAh3e
	j8O5TVAR1yRo5nJN13WFl/uEzY58C+l/HyAZQJKQIMFMdkDr/xqKA301wPCTyI0KGS8znTSV2OL
	JGm0McbibPchORGf1MoOGo1rXhc06ad3Lr+aXT03krMkrKDyYqyE5ytQKFwo2cGbPq4OYMBQXCj
	91UWF+1b6oelkHqY8mV4SyvFjV+Y=
X-Received: by 2002:a17:903:2b06:b0:2db:3729:22de with SMTP id d9443c01a7336-2db372924demr151107105ad.0.1788779080174;
        Mon, 07 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2db:3729:22de with SMTP id d9443c01a7336-2db372924demr151106025ad.0.1788779079602;
        Mon, 07 Sep 2026 04:04:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm23247022eec.11.2026.09.07.04.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:04:39 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:34:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260907110432.tgsesr4b5ylki7gq@hu-mojha-hyd.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>
 <20260907-economic-secret-kraken-9d4de7@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-economic-secret-kraken-9d4de7@quoll>
X-Proofpoint-GUID: xhp3vcTwNYHgDMnsDkFOg9OYvt-L4sqp
X-Proofpoint-ORIG-GUID: xhp3vcTwNYHgDMnsDkFOg9OYvt-L4sqp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX5kSxCHZjlpZ5
 2rbiP0PxQeVxB0mAtRAdlefqJ9UxYbDbTkkOF/FP55c+BXId5AeLkwpjW5sgoxuq10eJPWtN9jk
 lYQf+GKF5YrtdNizTalqDhWuosKeanw=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e9a49 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rLqlts3ajDfkqXRR3YgA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX0Nrfif4rwxPh
 /KqniwvwM5dXSbcns9YHAMOA4sFVKdeWQUewlDNv/pbiFsRaGY9TnGreqI4cCJCne12K+QL+lIx
 LLuPyhm3+GSNnlyb+Zv8xvlMgGk4F5aYVBXZctJmU8AYBJJLGGhN5CEMmWf6cscLkQoV9lxYxk4
 ruf8mqut0QP1EpxlOrBrsWEwgLWJItLjE++LptzM7hYZz2yXIttfG2ZcDk5wwsXQGvHBw1iahXH
 YjXExmSiK0ce46Q9Q+o3AS4EvgCufvwdSADWz+ZdAfTAsmgqEkGDzROhRgXmpUNEEsn6STlHfqb
 kAEuW87PUkxJFQ8XwnTvw2zZINyMlMzl7vni2xFhsZU/9e8LsnjkGeWRL44ZCFtKUTP4b3+ehVO
 fKrCTdkpriiUl1DEBaW6abzFHZEy3ZD6NtwK4yRS03/ouu+KjORSkeqYUqhsuG2domPvpoTTcfQ
 txZer29EdYAZLmaa8Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070121

On Mon, Sep 07, 2026 at 10:08:45AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 03, 2026 at 02:13:33AM +0530, Mukesh Ojha wrote:
> > qcom,hawi-cdsp-pas was initially grouped as a fallback to
> > qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> > Bringup revealed that the NSP proxy power domain on Hawi requires a
> > specific RPMH performance level that the sm8550 driver data does not
> > provide, breaking the compatibility contract the fallback string implies.
> 
> The actual OPP level is another DT property (required-opps), thus
> difference here does not define whether devices are or are not
> compatible.

I discussed this in the last version and using required-opps would be too
much for the temporary voting needed by remoteproc during boot up.

> 
> Maybe you meant it is part of additional power domain? But that actually
> still feels compatible, especially that device WAS working fine with
> single power domain, right?
> 

At the DT-binding level, Hawi CDSP has the same power-domain topology as
sm8550-cdsp-pas (cx/mxc/nsp).  There is a recent firmware change done on
Hawi after which it no longer supports the Turbo performance level on NSP
rail.

-- 
-Mukesh Ojha
