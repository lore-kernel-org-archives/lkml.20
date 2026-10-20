Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484410;
	b=4zbyWBw7ZtSIzJzt2qJ4uSZBFvGzorGcYoUELAHLzRCgxbI+sJ9RihK2eBZm2KqGVZRh
	 AF6WS9xpXyzkW234KIHUTEpbf7OCWf0+HcFn9iJILxsxpLCtD8B80sknwn3qBOjApbObP
	 sedgou9GmHJd8V0GwidKntbKK9Xev7CHGG30fOLyI8GJESc7f++hjgGTW/dB6ANbyOcrQ
	 xFqLOxWXnrSvAG0cOOWGYKB29d0AGf5QS9YpmUSjjD/To58WeKoUeLNbz4qGkCStzaoES
	 sImeZlv5k5+imBPus3Yc1F+w7B+sauBDN8OawwoAOxetilqQrsdS0UiNq6P0W3p0faQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
	b=yvRSSdOE6KwEXsiNn4AmAx50W+AuYaqOTc3VcTKWepkfYbWhyH3HYMomcHpb3vgLMRUn
	 LbSlJECf2sEHcIBpvihBdl+u6LPVhG8SmDfivWilgWu5+ZKK2oWkMLnWthZlQQ59zXyGc
	 RF1HrA9SL17OiTVb1cFc6mUVIJkrpOUMySa7l2291w1FKJGuCDWooQG9wMByTNPAHCH+t
	 Vgg4vcn/O5wCr/03TSyW6ZeDEeK484gGHGLPgd+yL5xBWGtViOZGW3tozyKu6EmN5gEj9
	 ZpzoentVG8WnPqKQXl3yZskXlCpp6xGUCsC895yeqOLdvVI1JLFtI2k+ZjxAuf2uOTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8SMxe8m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9LBQkyu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62501606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62501606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8SMxe8m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9LBQkyu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8J8nG4178129
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=; b=L8SMxe8mPeqC1GjA
	XVf85Z6x4XUkNQHaWNO8+AyZezgTB8WJ86GYC4iAKV5VR+ZvE0YR0tfNUrsHYLB9
	PDhZWsrBvHPKLK/bthpZmxJHP3+21f7dI4mOLKKwoVcMkTquxUOoMCJevv2r7jwB
	q8OVOLSDX4dis2sZDZmnGizOgsUUUQnBGOVBagZQnFDq8p7eeLyA5f0UyvFTwb3x
	2kLuZHAzU6ErHdCaLQJ6VhAyCL4AsukoBU+yBcPpS7y7Ab/0D4tYevCChtVPoI7A
	tr/tB6I4g8X/GVTEw9bW9l+X3Nqc+zUMPeWemo86RRlvM5uM6eI3gsTfFTRm7v0c
	3P1U2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1jpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso582497585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484407; x=1793089207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
        b=V9LBQkyufLuphv5qclMvmj8bntOfGRxhWm2o8nhVQ9H6xck1vDuZjUrOpNtoQ7Pvb2
         RQsbGywrADW5VMW3JD6DP4oJpHyyONxQAAhqAEGnT1pHk42OyRbxIFdZcswHsIyjH8c/
         0unhLz2bxM8SCCAXcPWuuovdYh5BN1gr2kC43TenSQrkgSyxorytI+hsL447eGBpZHMx
         3ubJAn30Y33hGMk1E0e+9Oya3XNypCm3isJtlt7Xn3OwyBrQekIYP6MWU7BUOjntpqPT
         /511xq52MinJMO2J/Dg66VkYhVIHGRMMllA/uLMicrDwvM4CgXixjdKcvjOR+XqajsAK
         g5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484407; x=1793089207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
        b=wjWRFf692aS0/GSGwY4eNQkg7m31TAVdGy1K7V4aQNV7zgxk/g+g7A/E0WSxyBydHw
         fVZkwtGbj5Txqja1Bm5aCgHq+9uCpfQrPvVYYlQjt23pXIDIXeJhIEDuLASl9mXiiBwU
         1XSCai3J/43UzcPnQWXh0r06hwULKGlplHKjGcj2tZcXcIqhw8fr9vXGOFtdNW25U4H6
         Wnyk8yWqi+TgIYH549YljGakVxIf6K1IybtQLzHWupVLrU45qFceYgxWl84HXemkMhfD
         UEa7d4QYjaLJLwxjPwfydtaT4EOy307GcbEKWSWcwzKh+v9BoYxPL8z8fwcZj4f2mBLC
         ///w==
X-Forwarded-Encrypted: i=1; AKwUvBz+E4uMDoF1x1JcmhmCprv+5C387Agh0risZD4sZMO2Z7xDJgv0prZhHMuE3UL+QDI2Ai89QPPX4hNhzKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKptmFvNp6z21L4hQzmxhL0/11vlowc0BL/zs0AFO6TxoTmsD4h
	i0GMVMTH95gUrfn612geqIKJLRGnd+Onw4ltg53x7yLf4IP6M8ZrTyNhigsH+iyxenIAbXp4hQD
	Ir4mUi4FgBglqj5fa9ZTsZejQfKW3BYID0EUiQzlV6zvzJV1DejSJei0g77sQ01LUQhU=
X-Gm-Gg: AYBFou3GJygpS2YyOcqRx+4pf1MK3NNVMm0mTb/nW28gWJpMYeGm5UWZvuV1+KzHfoX
	Rwpq3PU2mtgCX+BzfDMhK2pwxNObfTKEsnIUqCo927l+B36t3aqOirkIckcqgh7jHnyFc2KKJWF
	bjhZ2wGBaV82/leifpDnfPnbkzg6opqj+v2+8wwuzINIDiO/al/TJ0k1XWwT8TjWuraxBV1C3bD
	yOpC52Pae/utbygHibX9j1yCY/LP5yKsCaIDawLthkr0bvfZ0JGwoG7/Jchh52v+6QjRv+QMaF3
	ccOIgcaCq6yMmKTua3HJRJsoCjW2ERL53ja/JlnIbSv0+syVPhDwjKNtWjqDoueQdLUoPW+czrQ
	CLAKbBPoKLaPlhyYhYF7JoVv50SaS04k=
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1712837585a.15.1792484407401;
        Tue, 20 Oct 2026 01:20:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1712835285a.15.1792484406890;
        Tue, 20 Oct 2026 01:20:06 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f3833f93sm28793665e9.3.2026.10.20.01.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:20:05 -0700 (PDT)
Message-ID: <75a64aa8-cc9a-492f-9f49-008c9f34f280@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:20:02 +0300
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
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-sm8250: use icc-clk for camera
 NoC AXI clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
 <g56qnvvcuvih7pm2lhkppvpbj6squhwyi6sfvahw4zvuqitrkj@mewzkeerabm7>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <g56qnvvcuvih7pm2lhkppvpbj6squhwyi6sfvahw4zvuqitrkj@mewzkeerabm7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H-xZiMstBVbVftuNbh_KBVSBPnEzuXiz
X-Proofpoint-ORIG-GUID: H-xZiMstBVbVftuNbh_KBVSBPnEzuXiz
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad72438 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KSjN1H3_7EXrvi_VFQkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX5Zw07hK4O9dU
 MLRvqLCcgkEfdngG3r2jgajdCvUaf/Uo+Iot7n5uvqSY05esYDF4gLKqhzqMdzAwfm+5G+hAlNo
 A09OYh3e9iNVQxdT9wVsDIG3Ko5UKxMAw2WpXw4ot6yOlMBfxVpNDCqMzpbLayG5sfHE2tmCsDo
 iTF4cCeamElrdfY/okaJeURIOAntV0RDzJFJREse0izFKsPrrbO26Da+GwCFhu+WmoHmTIKAr8H
 bwlFnHo0BFATBTJiyG9jXHRrwxpmbt3TqP06s41rghd/z71AgxpTqoUw0pM+bM2xZW/ibi7pr/r
 ViB1YwTKqGEojX2C5R87NgKPLzesRBfw2XhnIfBPfQ/XBQYv9j4B7mQnW9XfeAWV4XVR9m/uH4j
 /+Zn8DQ+3qUtwgj3Z/vfFyiQYv8yzQY2trgv67cpQOHmaggy9vewjdvRPXIOZtTg5LRwij5uEo3
 dmq0xxe2LLJ/XgL5y0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX5uRvbbkibxPw
 GcuyPMnPNnVvtbVCTVWuJRl7emIKuJfDx01/YWvUoTCOj77RS2MzFQyIAJwygtK/48dc0N5N879
 PwhABQWWSZqup5Nxd2syJvfSvREnyGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200033

On 10/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 08:07:00PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
>> rate directly from each consumer means the last writer wins.
>>
>> Register the clock as an icc-clk path through the common icc_hws
>> support, as gcc-ipq9574 does. The interconnect core aggregates all
>> requests and the clock runs at the highest requested rate.
>>
>> Use the RCG rather than the branch: icc-clk enables the clock at
>> registration, when TITAN_TOP_GDSC is still off. Consumers enable the
>> branch themselves.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/camcc-sm8250.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
> 
> This is a nice approach. Several quesitons: if there are multiple
> clients, should the clock track the max of the rates a sum of the rates?

Max. icc-clk sets the clock from the aggregated peak bandwidth, and
icc_std_aggregate() takes the maximum of the peak requests. Each client
asks for the bandwidth it needs, so the highest request covers all of
them. A sum would overestimate the clock.

> Also, this clock needs a certain level on a rail. Are you going to add
> the opp table to the clock controller or to the devices which use the
> ICC?
> 
To the devices. Each consumer describes its own needs in its OPP
table: every entry carries the core clock rate, the camera NoC
bandwidth and the required rail level, and dev_pm_opp_set_opp()
applies all of them at once. Dropping the OPP on idle removes the
votes. For example, the JPEG encoder (to be posted separately):

         interconnects = <&camcc MASTER_CAMCC_CAMNOC_AXI
                          &camcc SLAVE_CAMCC_CAMNOC_AXI>;
         interconnect-names = "camnoc";
         operating-points-v2 = <&jpeg_opp_table>;

         jpeg_opp_table: opp-table {
                 compatible = "operating-points-v2";

                 opp-100000000 {
                         opp-hz = /bits/ 64 <100000000>;
                         opp-peak-kBps = <25000>;
                         required-opps = <&rpmhpd_opp_min_svs>;
                 };
                 ...
                 opp-600000000 {
                         opp-hz = /bits/ 64 <600000000>;
                         opp-peak-kBps = <400000>;
                         required-opps = <&rpmhpd_opp_turbo>;
                 };
         };

The consumer asks for the bandwidth it needs, independent of how many
rate levels the camera NoC clock has on a given platform; icc-clk
rounds the request to a rate the clock supports.

Best regards,
Atanas
