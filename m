Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E5409102
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884635; cv=none; b=isXYhwrxE9t9Pi9gFqwgbw4RIVsmT/prLYE9hfahFpmFUIDAqAqAydHbnDZxQCcsWbSBYgaruUAjGxyixNtk9OATaHgY7pQyj2LHygw/o7DxhQVckd8YRaNqvQpepInQa+7+ujJgCC6qYP+UdNVFlqq0c4d3Xt8x7Zjrsi9P1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884635; c=relaxed/simple;
	bh=/as17aOfJMK/3CjhOCiUa8dmZZDXaYvY9L11wwmexNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfmWE+1RiKLD/M4LxlRTE4ElAYcujNT9Ehv9LrqMBEgkX2jVIxOOGYo+HOl5oFBMW4gN5k8TPVXbB2BObc7TfVTQuYj88NCpfzbQhDlaHQl/5cY5j6sZY/qM/pvHumvVxZ8mpPArBYJTU6u9dEDA9NNI7K1LTVYyWNi6qLurQ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjhTMUYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQV+4OaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjhTMUYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQV+4OaL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9SY9F3476214
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=; b=NjhTMUYbZByWDw+z
	ore+1ZLTN3xO05rZ0gROL5ucutY3FqpnLiS0L6Jn6MtalYpfWKn8OReEtJF1L3xt
	wJ/rWIks5WLuHXudygGX2sfCKGMMKZz3+CxVZK0j+Q5M0o/xH4L0CydjZ7+deVBi
	2TNKpPgG8U18tnG0lHrgA+3dwG24706xHBnxH+F2h5zzO4LpSBw5GnfanUyctyD1
	yGU6fjCw0cvAFhEPYQEwv0XM4yzT5WhAYbz/W2acjrFf2MktZJ0oT9uHehDPWL7C
	wKIR20yqQ5bL6aegxMQ4DhUD3gm4TaJabuNEyPBMk1RRbrXgLPORpg9iVuqU2Wcl
	yZ6/uw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9b67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7295412eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884633; x=1792489433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=ZQV+4OaL4nJdC3m+1O4Q3TO0UCQGtV6Z88QQp4Rutpw2nSXSLC8sTbSKeHXrnR5sJ3
         NiSKw+/fR42W/NZGPXC2xCKlATxiasCcQLbcivAO31MKTBxletn2C2Uaqb5CMZkvsjO6
         +QSyGOS/Gd09EybodK8nQwEHTKVtJ3U8qZAxzF8jAXFiptfTlXHnCyUIbA6na1me8+Rb
         nGst6V++rTDlGs+mK44dpGi5wWpwCeOOy8WQaJ7oeYyVjIx65tHX842RBjG/qyDGcIcw
         JTYD0c4wsYXx+5kQE6aNHLp8ZopVCHU33NkVtzS3LCbKW2AtHR95PYykHc3GulPyv5wS
         yghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884633; x=1792489433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=mk3ogpwamtmrlrSGFl1gNaaKcngnBrXx9yrNbTuz2G4UnhOvxEbNTBiCCfH3Ax93Ma
         ggA0EiO6KpMlK69DywPnInN83dvv0+qPACNZjl6VtCllcGC26G6QsIBl1jqzJaFR+pSR
         gnjkhtEFsooPD0TZ2oWSVEvh9NTudmIDCICuL2gOwBPZoZ3Funlr78aXDx/uLql34LT9
         UFtNBvO9+REpfrkRAc+/U2MP8s63kzgmL9q4HuSX45D4JGQmZhiqA+YE1GvF1xXJOwXb
         jBJXRarQY/MGiACJe5yTc43u0z6lF3ExER5qgmhakHntTr33LMHR5N7WV+LV4D3p4u9r
         s+HQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3bG3i11pWT62sCCoH8ErTFaeiPrfIYm1eY50U7e40lWc44lLFUg/ySJpRbNtK50PFKzXKqXTQIAK9Qn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH5YKJB3FFN5r8ptyBzKRtXob7ckIajTs8vcw74JqAQ2uS/b3y
	0p60V52UpSF+tepT0TFRNMSXbW+kI9jJrf1vhGTSDZUl+3n+KKhykrUW3nv6uksDfoFlei8oCc+
	P4lT/zQqPI+OVHyZDFRmwaSXkFSiHfSi6LGidoZtBbF+jErWalcWy0cjCUJB9jZ2UHM8=
X-Gm-Gg: AYBFou0sRmjA2NXu9+Z+5yl/tkLRIHdxMFhqMwJHw52gGX/A8q9qhO5kjNf/EYDq2u1
	6sOzKe9Zx+/c4w6+NkDovtrIeMOWlj4CttjzAxX9LBE2J1ayWldWWFa7gsnRvYlLCHgB1ucpsNf
	POW+293aOmiXVDLD/+LY3mnoKaxC/X3Vew6tAuzBTL3CYMCIm2zZnYKiyTajAZ1+9BcJPQIMvli
	7bAlC+aAjGAlXFm+cdgs4oc5IFeY9q9+IQx7Dfq5j+AtRnIsr0+rHLAGr3uE9UlC3aMuhV5rCKI
	wiV8gtIRDFoq/VnqJu+LJpffVFSSIVEN3HBIVYRnkjLjvBICpSI76iWOM7Fpllp8ll05b81d5aY
	KYEP/biV045Ea1c4ZTYG6uYTR566E
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604303eec.1.1791884633229;
        Tue, 13 Oct 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604268eec.1.1791884632686;
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm39101861eec.6.2026.10.13.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Message-ID: <d6aa17d9-828b-45ea-b2bf-940f855a00cf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:13:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
 <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h3HP4Kav5IexQKhsbUWCM03N1GhIDfqo
X-Proofpoint-ORIG-GUID: h3HP4Kav5IexQKhsbUWCM03N1GhIDfqo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX/kd/ecniIoZq
 EyJH2OwraB5lyCalXV6lek1ey4MjoPpk/qsPyuPhW7ZM9FswU7iR9kclKPeLGEtiOR1TAfpDC9p
 A+L+cLZf9T0FEeonHKRe8wrzuhR8f6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX2+D4pUac3QS0
 0ZtGiNoWK98tx5fSYN5N9pNLJ6qf/9cl8XgIn67iT9KmE/hEV4rZoypeN6e1qCVHOscpckPJ8FA
 XjZ5UnL6Vj0yi0OeMjbWhw9I4Yjc/SYEdQPtkzJOIkaqhIYX4NrKYJ3E3KbUgkQLfhcbQhKrIxO
 9e2LlnZR7FHtqKiZjjVOaWU3ZXcRmiffpFUGcyzF8O7xQHkxkOyrQjucfKn0/SYawdyWOWqAdw8
 McOF4nI5TiVc2/G7kWnqlURiem0pOXmeEWjx85luDlOC8quIfuJmnAVlAEnUYG244JxSYGu3zJH
 vrS3ePz5mZjqMUPHWXMSozOld313SuscBHlfEUC/1IFEj++beUUsggf5QY+1rVi0bPAzWMOqYRV
 S4aKmlwOvLKfDENGhra4JbFRDTGxc7K+uFK6A6mElxVZUMGRp9XorvzSMOPmh/FeKQKzfCUr7LF
 uIm0EIYUdDmY4YbjhkA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdfd5a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7UbeVSx6ShU6YajrLr4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130038

Hi Mark,

On 10/7/2026 9:42 PM, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 06:16:29PM +0530, Jishnu Prakash wrote:
> 
>> Add support for parsing the 'regulator-off-on-delay-us' property from
>> the device tree to enforce this physical constraint.
>>
>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
> 
> Since this is a generic property I would expect it to be parsed by the
> regulator core, is there some reason for making it driver specific?

No, there is no such reason for now, we'll make this change in the
regulator core as you suggest.

Thanks,
Jishnu

