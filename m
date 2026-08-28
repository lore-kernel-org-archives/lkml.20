Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC4445AE3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917107; cv=none; b=Lgj+1bv/oC2YxiktWHzpjlvXror4AjYS6OT4dqX/0WVz6JGVl4++MffgMi48/K0mx+7bM9aulC3N0Ss69qKNNoWzYBuluCk6mVl2s03gg8Iuc+7DlhJFAvdKuCRP6JdkMvnzA45xmQFoSHNJXtWzAmxa9wDRCjoyNo6PLB2d5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917107; c=relaxed/simple;
	bh=e4BUwiK0O5pp5RtDiOyjiR4KzXtinU3V8dQQ6IarSGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVWJgrI6EEssxV5kCYEJB8lMzZ3jYf4olcP1MWnju16ednVUuhepqM78fWiV0J5if8MIwDB87KQL/LuM+Itxm3lKvjpbEbnLkcZCGJKgiucBWQO/JvbPCzUjUEGAK9oDHAO15WBZRWJeI9bEGETmUHxE54KhvX6aqZkFXrPiYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymyc+82u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTR3DC66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymyc+82u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTR3DC66"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7pdH2152678
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=; b=Ymyc+82uXFNNV3wV
	ATjIW9o7k3tDsJyBQxpPwgB43DEIElc9trTGzZxko2scs7Gxm7WyZpmgr6Dvk0oP
	oW59Cf7FA/l6gqm8z8Uv4mE5iX7CTnjTzrFyHHwa1keLY003b6ae/kc2nzU1YHm7
	JEwhbTEo3KkZMH4D+XV8Sli6sz9P728Yw82F/x+sEg7DIUOivzeQET3aLvrUM/MR
	k6qbSnOZ1PW1VggBqDKJUvy+qHkt1Z/OZcuoF40/trDv/GWtCB+iqrFuP9d8iEfP
	vPUFXnlp5cU+u59RaoLXxRzBFevV9JKD6+xtjKrIIJq3if+X4et2i6/HKxmwi3hh
	JpwRUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9fvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso2404001cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917091; x=1788521891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=;
        b=iTR3DC666WpjjtjIUf635Uee5xN7CF7mbx696aRi8WB3O2iIOVUV35HawbYqcK9lbc
         8dzKuqn3Yzj34ctq4NlkFHlkDgzGOPI6KqMX3cDx+hgYtUNehmF/aUmdiCLtMXviT5oP
         siBvcmRIB/mbQgQ9IERDwrtopd9W7Vf8spDQkEiZb05zUfu22KWCdgNs8uDOk1lkiJkt
         rA7ADYLCelHsqREaO3Oef0zAzWAdIRGqTSG6IWWXsk5TVOQ4GzyGbom3i4V/csVNzTos
         wuICqvOnKOT50fJEcIRiP9vP45VCj11TqJEQdDfr7L21Lsx0i5VRrS3ImcNIDeUOu4aR
         nxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917091; x=1788521891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=;
        b=hAzSVRYkRwfM1rrOKGp9cOs8209goGy+skKiG/Y3/EayKCf0gj8LyM35a6cb1cREiu
         iDEOGUvVZO4d2IZ/QH4w9GbZasaA4WR0TSf9W5RPrRHCay92IYMlHCU3s3V6GeOR8LJi
         ltwNdoatzD7axBql9XnEHLjvrrtW/Es2yKhXmgN0ogs9kwgKP4WG3SVijGambf8WnlG7
         e4YujRnG4RVVywH3dT7w04+oV3++nEmHDu+u1+x8LMrtx0u2E+MN2dYiKGjUxmLNjVpk
         SX+5wCgLPFFEtN107eOE4bLXjKfrez0os+2QziWX3fAmKpTg/SzJH/N3pPruchOuUytx
         kTuA==
X-Forwarded-Encrypted: i=1; AHgh+Ropx87XYCBki/aWlfnP+0CFCRW/9bVn3i+laX7ibJ4kZBw0SQYANjlSpNGuMvtM5MHuvhvAVs9lVyr+bfM=@vger.kernel.org
X-Gm-Message-State: AFuF++m2NqlMUY9j+eLuarSskZVB+LXfYflV2XloIIQIdfb17Y3xPJDz
	DJBPhTDX/kqTNwF5HO3t+D3cEipaLJEHhW/kbftqiIWFLCPXg2OgDklMWZqXC2Jh89WIJalyhDB
	aM+taWCd4PCxHkkHRf7PSFWnsQJwKad6qECvt8M91ZJzkdQ/uHBPY8vNAfdJC/uoscBBBuPTj3H
	Y=
X-Gm-Gg: AR+sD10fAeDutSY985t+/JNULXCET+DusUfOVjA/Bi2gYU2ZVnXbLsx4oQDmfWHnh1Z
	AU43+swiv6TdNCRujDaT81mqulFJ63LMvUsj+rdy0Ei4VirtHAMMYv4EONvoRTfdjVTWi2NymQV
	JPCN2YcBk6HrsYJQ3e6yf1nK9IygXdeY3xjIi74P1NW+YnBMseZKxbMszbgRJ6nvv9KFUoL3VzV
	qQ2NZz7ZBsJTgORjx0adO/56JPtx23+ml01t1WpD5pwhOVx3kpntk3YDC7kSPvvLqNlGMvLmNDs
	wxEXo2vSYfjpaZggg8VpawEBC4FJOlfvOxCYP9mzwiO0/9EZvWFJ9WD1psfPkjT+sJH8d7yB6Y5
	KXv3pjXZkK2zk8t3HtGQcHhk=
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr49743061cf.2.1787917090059;
        Fri, 28 Aug 2026 04:38:10 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr49742691cf.2.1787917089483;
        Fri, 28 Aug 2026 04:38:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c5bdsm405108a12.2.2026.08.28.04.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:38:07 -0700 (PDT)
Message-ID: <647baf49-e361-40ac-9359-1ad32f5e2959@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:38:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: fix 32-bit overflow in DDR frequency
 calculation
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4ARCh-YPrhzJ0rmz6bRR_LEoqcBZPzDk
X-Proofpoint-ORIG-GUID: 4ARCh-YPrhzJ0rmz6bRR_LEoqcBZPzDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMCBTYWx0ZWRfXyeWmzyrbqV/M
 ZuMVTm60nsLKjyvvwiZB5UnLLvOvQ4L2kdf9w7YITJXSNtR/yk56tsLeB/4KtDJU7lV1IRciHEb
 LUGVYpeKfdOj8m1zgKvXOrYlJmqzoRsP9F/Ej2r8MdRDylCmIBddVuvwf8MpOAL+DavFmfAImhy
 364iNk/OfVTxGG3jNXmabU8hmOqMfsVt4tfdzRDHUCKrYIpuc8CqrjZ892e9zSBvSiOdoPTqdmG
 /theR51MvZmI2rub/NxLQFEPMCGw+kjitgzykx2ogZhIFWZar7pbvzIZ8Aw57hc9VbYhuydEJN9
 MmeeLV5a+X0w5EQeuQk0jHNyo7f0kEhHucH0V1pXsODSnwVb4CzU92meiG5OzQRXglibF7IRFw9
 AWn78eLEvSBlwCvgqkx83loDkvM/varg7dk1K5MQtakGhyUrbqh6X2sU2PPgKwmo9c4+2G9gPJQ
 B5LRiVpLkYWb+qhNsVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMCBTYWx0ZWRfX3KNBa9AbNmTP
 OftvjE6zmQoLdyU+2WeKUzzrgPYDno/xX0a+VlCuWu+vYq7scCiDvh8QgCnSiOsXv0lRaMe8tro
 JWdccJLyPqu/fJ6ourrBNVlU/+IYhZM=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a917323 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zBPrFyz4c75jYLj3IxUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280100

On 8/27/26 10:13 AM, Gopikrishna Garmidi wrote:
> The DDR frequency in SMEM is reported in kHz and converted to Hz by
> multiplying it by 1000. Since the SMEM frequency value is a u32, using
> an unsuffixed integer constant causes the multiplication to be performed
> with 32-bit arithmetic.
> 
> This overflows for DDR frequencies above 4294967 kHz, resulting in an
> incorrect frequency being reported through the SMEM DRAM interface.
> 
> Use an unsigned long constant for the multiplication so the calculation
> is performed with 64-bit arithmetic on the supported Qualcomm platforms.
> Apply the fix consistently to the v3, v3.1, v4, v5, and v7 SMEM parsers.
> 
> Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
