Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574572;
	b=5gmT6zKyl9HY+Pg72jbsjnkDsWqqxu3+vIJ8msDGtHyG/giuwVZkdDw/pFRSz2UKOWFN
	 pIggZVYDVks8a2eMWmLfw9gMlxK1bX9zSDYODtvp9NS6/Mrp9iWgL9/KW8/8xQ737ZIHt
	 J8Q/mMQfhUBCsToobPMZyZjfMimIV3g5fvXITExPGMODUK4EQ7bwbnIjXrTfZSe6OZbfP
	 RM8HEZrDCzDNgNN1W0mzaawB9Yhs1BJxwHqQ96O7PhpIB3+naUFgnz5xTrCVU5uI37L+H
	 K8HocIdJaRD2MFiRxo4teTXFdLNf8rsi86ODf+OwC0Ln3rrLq8J8PYP8nBBYjIsJUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
	b=WZC3IV6woz/ogfGDmm2QhfhJ30zYV9TWrEkj2WImbVgtDzzgCR2pHECpPpY2I5bv3xmY
	 OaZHAUBuBq3HKLtNYPUDGFCqnWSO/mgqDcIH9bj4oU+YYfu555PisLnPubW4q7WtM7Ykn
	 mHkt0D4wrjoSqKljk15K/tLmzARVhl2y5imom+W5KkACvPoL8icfh3Foi23tONHS1zyw4
	 ISdO828j7x9j8kMQ8jrXbdL5VSge/BMuBn4rqWHuFb29xX6NWzyLuESJAiVMK2E5NYsem
	 qJZeVlReiieo6zc/MVRqcZ7m3fkJqOfhL/kko2tBWA35TURDYAvaV4eQSiPmVuDcrnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA04E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8mcKq671192
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1qyY9vNJg35boytlmY8FgdP9
	XXj7oos7HKLsMRF6CNI=; b=Gp2PkA6Gay0NWw4nWoX7LGy3qwnvVM1dhbgzqwA+
	OfbLIc70GMCuhPmIM6qldxx3yr72RFKnKJeNFRkCt9aCB7bu9vne1Ix9b5mbfzVZ
	YBinjI4QoLYiXs07x4MQUt271rjCH/QYPcpmUXTD8vrKxGXOkA4rctJtM8g+J8lE
	oBsiPVTeB6KNh7OThcV3Q75DfGYRpyaUIfhAfGbefL8KRMDLNK+FVge906XXOkQb
	ZNSyIiwpvMZi18xhrhS7XCc7ZHYFqzbx6Vc8Mh7G8OwzveJutLHAyigIRtlZ/V4g
	4Au35tOcXVkCTfkMNGap91FXPFfbidf8mHq6ufHr+YqACA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk7wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso68815685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574570; x=1793179370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=ewmEhvw3IfGKeS9mWlYQJjMzCCKzoi9oPEIk3J5OlddzJuP6XsOJr5gycVakjogfpN
         tIuUoKzl1MkeNUlFRsAceEfW67xN5KF0tNoppfUsRgywv/A8LbfDDh6yXM/LCQCnvV6u
         qwGkh5gFIjuyuB6Fc/PG0urC1zWAHv3ZTj0HDiQgoQ++2LKlFsCP5rBgvI07PugVjjpn
         C9j6EMXYWaG/EannrkguZrkurYvH/IjG9mcoSLD3b/tXHEGhUKD0Sqs4V3lB4KSoffVI
         yiopzJjMBjNi2ptuaGOq2iB1BIvBqlvQIZLZnCmjpVgXj/BqXH+axwHgLnA6UiMulfb8
         LyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574570; x=1793179370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=rBCpqxUV3CXzGukpLwDKoiecS+aQ5sNJ1RIr/Grx2VwpjPZYq7vDiwYMLI0FjMI+cN
         oIy2BrBGca+2OzrYike9mV2nyXbIXwcNwRSn+jPA2ngmv93l5wmZZKtfBjDXdue6pf+V
         v93FUJmByg/WfpketFU+uJ7yjD/V6mWGggmD8zvoodZFPibhB7OEuqV8tM14jogjYQs5
         T32PuyRxvTO5SRiiSNSQF1La4lyD1AK5teIEM+LNYuU1EXXVjSh6/o9QirA2KHA9p7TG
         7u0wfB1MRmowZkOrVy13wWbeGLEAigdNEWvFWYnCJrfdu3q9hxkVqbClrsAgw0EVN54g
         FyyA==
X-Forwarded-Encrypted: i=1; AKwUvByQbad9wThBTsT609/YvZfv+U4T3RBhiMQlHRvgd21xsPJzYBxZqnsJNwDul6O/+AQkw1/BmuTtzAr1qdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYPnMJf3vlbfnbb315tpgZmV0tLnOBDjSaWF3GCVJVdG0c0Mtj
	YSX9hZj7Rl0UQHySHG4y2wgppHQFR5ktL4nHbxaatWVjgnmOB1/ez3RkvB/ZnPjh83LRCUg4pi4
	yFHBUZR3f9wsyI79lCF8PejAhX1JidiqTP9qMmPqPZ9I2YpPfGiS7+47v1vwg/OGNDfyNhMED/k
	0=
X-Gm-Gg: AYBFou367HJ+Y3b57eAT4ZBtkYXFZjoILJlwKanyuiisDDwsB6SpzIl9efHowYyWqe1
	+41vQA4Hz2nBW1VPYVTYeJB7ZLriUcx59nwj0A8sZV5iVr0U3C0S1UXxJh/oQqtJJHGO/f3YMhF
	AklSk/ySrh3r90DpKTNs+QdmxW42A6qLNW5DMjy7roUjoz1VjVKxEIfqkR6D+b8xiOOwnMFJFvB
	baQoV+uz10xm2NDMKaBEd9OZU/xMws2IWUg2DH/4y1kz7Zrgf7Y6/whuVIbejArltdQKWcIJ8EY
	IK81XL1aDIuacQz+Jx+xrbOCwBSUG9vdDr4Gu4bPmcZMOZlTUkF+C/WJaPNNtb1E7VWsAJM7Ey0
	IrCuvsM7hrx5IWr3o
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326673585a.66.1792574569774;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326669885a.66.1792574569184;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm4446654f8f.16.2026.10.21.02.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:22:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:22:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <k4sf6tipaehtllokqlunyocxuecttbitewgzjzgbl5mdz22jfd@p4svha4g2vvm>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzONsATzsdjJQ
 iMc3UNjIVyhN2Rg6iycwBDQVsry6oLxztEwYDsIM5zkI2/XyB9fRW8eekImC+zydrWCoOJZpRSa
 cAv/1iYX5sw5ltjKfNwYMNqQDZ2pnD4I5rSIC4bpe75n6Nz+t3JxZ/Bps0fOjpPDKmxQQzjOL4i
 G8gFGY/6PzZh1yXKKafJms8w2mI4R5H9bEM6kYWU2oO/H1YEocjtN+k/eUPlm9UfEk7uwqRhcS5
 Abx8sw3lcQzw25Ye1vAd6DWAVVSKEQ8eaOsV+m2r73SbpGhOWoLqlPyZW+2kv1TfzvXd/6a3zXx
 w32p2rkjlBFWCkW+3LgqAEryL/YS1d32pXLRMrniaqfJNIGRLZu8kCzzgZKixOxXIj8IX1mfjGB
 Rf6IE7+DdHsecotFeWELVKmL5nkfeCUfF6JKyviulry/2sSuGxEd3EMzIVMZN0zxpVygm66SXha
 yyyjtCsn9De68da44aw==
X-Proofpoint-GUID: xiGXzIOoyoNUlWemog688tEqBdyELH8X
X-Proofpoint-ORIG-GUID: xiGXzIOoyoNUlWemog688tEqBdyELH8X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXyjxqD4oLGcce
 efwwcXGO9NLjDuh80nCqmhdXwWPNzdRsH+tbBYMTMe1Y1luEtdaEC1R4XY9Q8hKUZJHsgOlImJh
 my6EzSitvc6pldocs6aSSmUFaNYozN4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8846a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=eVJ3CmYOr2qKXInMw8AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 26-10-20 11:49:10, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Rebase onto next-20261015.
> > - Add the ADSP remote heap memory region (no-map) and VMIDs.
> > - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebase onto next-20260915.
> > - Drop the CDSP glink-edge description, as it was merged with the
> >   CDSP remoteproc support.
> > - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> > - Drop the undocumented tertiary ADSP CB7 stream (0x1087).
> 
> Hmm, you still have this in place.

The tertiary stream that was dropped in v2 is 0x1087.

The 0x1067 one on CB7 is the documented secondary stream.

> 
> > - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> > 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>;
> > +						dma-coherent;
> > +					};
> > +				};
> > +
> >  				gpr {
> >  					compatible = "qcom,gpr";
> >  					qcom,glink-channels = "adsp_apps";
> 
> -- 
> With best wishes
> Dmitry
