Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC9457E77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980808; cv=none; b=QrhewfnJw+Hv6hEEFenhV0LqI8rGcj1002JlyAHriYi8/Xkqtgr3wadyIRq9Msik7TF/f7Cg7vznO7mQf3/lod1JMZY5S0Cn70hNAWD8s3scjPylB/cpyOn76QMqI5dZ9JxNykYoLKjbHRIUH+Ox8+svLuoMIAJB3AQdc97mU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980808; c=relaxed/simple;
	bh=qxsOET/xoTWM2NIVM7JWYgLYxIAqgXmxXJlrSmA6ZzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/pwAMRcrTVvlm37TP2RxeYNuIEqIOtikQ3+ZPOEXJLdVMSoLsHsvV9PswujUjjpVJ820QrcGccciNER/BQh7fkjVhkE8xwi/rnWBbWVBBXtOf6FdUTcNnaEIDdDROOrtiFPNsC/MIWthn3G2iRIAYthdxp4LUAqQPzhCbg9MyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJLJKY72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oamj+WXI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJLJKY72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oamj+WXI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F4wU957118
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsih9RWF0CqioO1q09Qzdaef
	pjJ4G9tkVN1i6xRJvsQ=; b=fJLJKY72xIusM9HgFEJpL9Bf2P9NyierBTnDvH2A
	QaxiA9oycf6MQoHmkSs1IKiwK5WXazOEBhaa+SPLEew3bv7XSDmg7zuOe9Y2Yz7N
	etfMg4VELCHqKKAqh+g4dzTXPKL24P6Z/MazBMqgm4QJPwSpOfSLJ/7x5Mz2SpqV
	VJtSg95j1hox5EIymNrBq2cgSQMY8FXQHfVcWcvXohh/9sSZXriXeUJpuAVYtK9m
	7K1Sd+BAKkclZ4J+tgdGD2NebvRAn7jT8Jkgc1cDhYPWHl9JHw0ydvkcLLGGxGYK
	18v46TsdS5oZsPYcIwuWit7H+KbIACV2TVr/unSBaj6IHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0c70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3379730a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980805; x=1790585605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsih9RWF0CqioO1q09QzdaefpjJ4G9tkVN1i6xRJvsQ=;
        b=Oamj+WXIyL2yNM33oto+An0NY32DT2VZ0HgMjpUamFH9+fECJ4+a8xw0hHCAHZF1DR
         SSVMRJZruIBe4pMMoK5+y1sNzHNI5Y6gx+FWsA2OhQLp7D9KS05aSF2+AEeuqIc+cdso
         kjhIoaK4ZOzP6pES/XYK41s9dKiUONSHxqwBsW7MYbeewdKTlgTAfbBh2f5b99z1xCcP
         5bK1idq06NFfAqTciOp/ZKZXL4G4NZBAlLjKzHXeuiF3AOrctVVcaVxkf1ziWchQPrW4
         6hspefHtsUCwvKYaourY/J5gfHirVq5SOUJCnDJ/RasJNPcPJ551Zb5QBf+5gqzx0gJB
         Fqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980805; x=1790585605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsih9RWF0CqioO1q09QzdaefpjJ4G9tkVN1i6xRJvsQ=;
        b=q2YqvM9vxuuaOXnWsUiJ70jTx0ioQ9lrESxadXe8fIWEskt44WMQCCoweUQcyjMbHS
         C1f2waOgLi62JIkY2n351kCWB4Ic4/20IHvaq7B5TjPuFBK1FakJwd1/vyVf9BjH9xxi
         6hGme9m63zO+1MrWVS70CC1iMxEj09rKxQiTybdhB4ZffbYb339ztPyUJ74eZhPaBhNx
         hyzGMwbtLcU+YrpD4Hg2gCqhfkfC3xKClhI8FMjZ7Hou1FIJhz5+MPHZG5a2j9hOm2SA
         oHd6gFLwRpWrLA/T01inm2cQNa/PQ+msajDZfe9yU15zNp9fHCI1zlZSwq4KKDAxWhAY
         PEqg==
X-Forwarded-Encrypted: i=1; AKwUvBzMa/k5Lq4T8s+qI8sPpVXen7hmRr2ZkhtGnNgGxPCgg9zbE2zpi2xcrfMQyQDVmol5GtTB/PwNwr3jFKg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7YBgqprv1SBTfzpz8kSZaNhdk9S+Qeon4Ku9qBmc/oh4Mi4d3
	21eoEXdWakt1kkScRu6lDHTA3UPjDQhMwBR+qwQkuEfT9NozxhHlWkTlQX7odqLJXJsL1dfkKM2
	JFGLzTX70NBaqeXueCwh9/0xyC0b3SOcj5bADZGxZsLuDZTuaYQba6AsUXrQjbe9xfbk=
X-Gm-Gg: AYBFou1J1QYVoza0DqsWQTRv3wdnCS3MRlQeLpoC0t/4yg+z9PFwlXWKX9BA6cm9Zm1
	k8jzoryss0R+cyMW5qH6amptQ+TKyTX5nwp95PAKcR3agsd2nmIJs8yaJsdf0ALrJedS07pMho4
	OiNp0xFA+C9Z/cqP0nb/al4FeQU7bQsCvhJil3UZeiEwkAew5GcTcx1AoBKwplZNczCDq19MzJO
	kyTZNro5xg17hCXgjNzPiiLygk6Q24hLPuTX/SENKwYXmVfiahzHaMkyPdWi23w+7H9SSwuc8ul
	0BFES/pD8jcEk2lP04DcYmjVv0goHYCHw+Xq+ZNGpewuoPt0g/YIF3I2HhWkVhEOZf2SE4bfoIS
	bQlqBm9f2zdEtXNjxHvQNsKooCNBgVHcGSxwq1+duoA==
X-Received: by 2002:a05:6a20:9192:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3dd726822e4mr16962891637.19.1789980804671;
        Mon, 21 Sep 2026 01:53:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:9192:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3dd726822e4mr16962873637.19.1789980804259;
        Mon, 21 Sep 2026 01:53:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm18455477eec.14.2026.09.21.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:53:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:53:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <arDwfm8kRLUoyxwO@QCOM-aGQu4IUr3Y>
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 6lE58HEjmAiCjwm_L2EU7l8ZI2LE4Vzt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX4MJXG8LKw3sV
 wHufZE7BLDqLkg2keB5ikgZd+ZFuFW/JNnDzopHw1dJG09d5o9IeFr/SN2U6HyA0s2WlXM/oIz8
 jHLY86B0l3cAHWburp9GZ5DyanE1p4Y=
X-Proofpoint-GUID: 6lE58HEjmAiCjwm_L2EU7l8ZI2LE4Vzt
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0f085 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q8UMQ-RfGDYfl1K3PHUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX1DEb0rI7uPJ5
 AMKJPzs8uEqm0u+4ohiyJQj0ij0AYjcwmCYF5LmSMtQeOZYGqBS5YCfDf4YyV+SAnyNDDIRXvq/
 IH5YRiN5NfkEaCmWp7w+7NQnrYCUgV5ClMhmX6uKhGZUpEpAtFnjkqPD3BrI1T6arZWxcLlIvW3
 klDGLbX7GZQ/veYgVR2E9gnXmoAZWhv6nH/LvxoqwyyWokAsVwtdNJF0zt3/L9uEft/ZTHQv38W
 RMOgm/TfGkPB3hdWtFNAH1+Lq2CNB0MFnukbuOf01xMOq2Air97SsBSExCtzMRCVdX0mNzzry5y
 NJlDq2Q/uqjEWBdqwrfvHdXRvoR6fitnZdM/Cy+EFq0tGR7uESfYMVdsZ2PlaoXCOxoXQCLNAaH
 moYYXZ6JId8vBsb+6KMuiIzjH0XbNcxEWEH/4Ig6/ZBxCb7Vt7Ru5/reKTitHjP2tn7ZuOR6rp/
 INNCvS96WCwTBedgGCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210126

On Mon, Sep 21, 2026 at 04:49:20AM -0400, Bartosz Golaszewski wrote:
> On Sun, 20 Sep 2026 10:10:49 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> >
> > Add the GPU, camera, video, and display clock controller nodes for
> > the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> The last bit should be dropped?

I think it means these lines in the patch.

+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>

Shawn
