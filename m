Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F94CB8C7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786030; cv=none; b=OA6Z0lKKPZMYtZ/sjmGynPwo+HUG28C6kDLqYaqMYdrKQIpG/PZFJdsGwU4Jp0NWazwb/AnCuRvIskMrrbf4MesCvZDTYPggqYFm8h0Gk4LyxH2gBV1AE6z0FAmmhoLsIHT2UPPz++URFtIefKh0v8MTx48XAW5sl/SVbtuXN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786030; c=relaxed/simple;
	bh=05EZwX1QMXFOSIQZ14nOKqI7np8+6IotWEOKE6xgP10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stT8EP/SRqosfT16vqVO9PVXGtfJB2VCF7WN44GRjfFIxI58xfgDjpOB5LgxKbJcpMsmjTHVpgNIOeFsG6HGEJEmgdwj/ENvtKuP5wkWxQYs8B4wiFBWfTYS6Kmqc4pSuU4seaJtaG9pOGsMsuTOR2wNOvbr58EubWK3Ph7Z1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/YZOSaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eienkadi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/YZOSaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eienkadi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnMXC3777241
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M6RYt5tuFs9RsQAwQKjVnrB/
	XtbCHA2aTJv14rJA75U=; b=P/YZOSaa1sFa9rUv6gNOnJuNt/rsb4w2KiE9Cwyv
	osWXW7TEtLEscRHiOZHzIY8HHnmoVuCMBOmXLbdspwkhapzLMMy20RznhCRcj8zj
	yjlK15Ap52F3tS+8WAzy0sfGEqNINp4otzM8DPtRQl9xrCHcKMWKJW6DKEgyQRRh
	TFVvQjg4+vDLNMrh+CXVOPkiBAypptynIFJRVfJVnvMVpfAkgMgMBm3wdD4167RH
	818C1iOe+a6HthteUMpXPvzMt8o8x8RvbDU/HSJgJ6J7FkxRAyiN8L9nFRr6cGqS
	C4xcMACYvH7rmPbpeaDE1bNw34sPxJmYMcVWMiReDBGjxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyh5hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:00:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2955261a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786005; x=1789390805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M6RYt5tuFs9RsQAwQKjVnrB/XtbCHA2aTJv14rJA75U=;
        b=eienkadib4ZZWZC+I2gaStbKzzn5z2iEcttckMttw21zjtSxhjKq7IYTrve7Zhm1iq
         yr72W++MKc0qEQwqigoeVSR9uC8MMYgGvyhwhMosC8ju8UyYYgKhwKzsfkKJstrESeqY
         WsT0Fd+KXXidsw3nJ0pGZXdcsJIvW5MDCbjSTTCqodXAI7SOGWC2ujFPJS9BsfeBXpyU
         uiNXMUOyxI/qlM4QLTzFDv6unmtY6K2N5EtmEWLbl2OhrKbUhHiDRpZFPE5J7G5PV6OS
         W2MToWQqjZIiluovLbjUNQjl8MRoOdNmlHw38+yw9O58anEPZqZdmONtn/W68Fop9ZIJ
         b+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786005; x=1789390805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6RYt5tuFs9RsQAwQKjVnrB/XtbCHA2aTJv14rJA75U=;
        b=sOfJ6fIytWsOMIGhPxzVs9gxCYO6Q7PpuHwb16GmvpGao+c4T5vjIgL4/uWeFlNi9z
         dXiFGGOgynS/RF+OinuLeCz7fU/T0IkGm8h1p0KCt/XtruuPj+WMCmIm3floBY5C8BiQ
         +UkrvlJUmkkKdwrWyRnqFSiVuOeKcvV+d69fOVkcNeXxBO+vc/77wOIS8subTSvZMiqD
         QCn0wEh89FOACXXSRjPJpWtik2E+2FDk3skFJeoRtuXKZAXBdd6vkf6SlAPDEAnq/a1h
         YaReYQOES8MNbcS8GnxlmGGNsVrSHnw4NYYZt2lyePgNJ7TwBaUhXIV37PZHJnDmMzLK
         mFVg==
X-Forwarded-Encrypted: i=1; AKwUvBwMT0wBOUQigCj6H7CjNGO4sVunNom7+uREj7eVNnrUIRfkW/MCSYGgFTIlg54zF3HMd/yRP2qQwFHWF9c=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ5TVgI+kRxeAupDdWL6ZTJrreSgVDDXqBdfhbqmGIjvCSI8Ic
	m2YZKotX9LgZfL8eTB2K6hT0jvkbrXS/tSOzvhhDYyw2FY0N2FvVMN/uQwEE1cC2FQVozpqF4jt
	x8mX+DX/EnQpO0Xmqukuhe8yb2sCk5EcRPKzs0Uy8cXShUjOXdv2gb3D7Fk6wjFpUbhw=
X-Gm-Gg: AYBFou1qwb2pUzZLmk8jXx3QPB5lpYk3PuXucHcxun4zy/tTVRFxmjH5/z56wK1jZ8a
	xo5y6qJp9PCIHHVca7Jv0TNNwd6SGFd+uxk1VN8EfludaNpT3vEnlFMa+84RmuGT0IOXhNZdL/t
	kQ3C5g9yyxDJYbp+MNv6jDFTkUNDDMQT2bQcnbWvMrTj2O3D5qBUrjU2UwUawmEz0dr80/avaqR
	+HZeUVwzobqRtLiTwj3sYFC7b8hqc2KqfBrtddnA41JDkc025lMZrEhAD7CgEcWuBcY6a6UCYeY
	g6KINqbNu1pv9/MAa6HpG3XabQfkLcd8pVn5wU9Aw5BLnKvrYUH+gQzDPL1pNzMuaewzIQlFa+s
	U1DFWBMBxfQ5JDfWOYLIV5VOFZOklOA==
X-Received: by 2002:a05:6a21:6f16:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3da3a0a8503mr37283030637.13.1788786005461;
        Mon, 07 Sep 2026 06:00:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f16:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3da3a0a8503mr37282924637.13.1788786004899;
        Mon, 07 Sep 2026 06:00:04 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm17681070eec.28.2026.09.07.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:29:58 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode set during bootup
Message-ID: <5b2yo644hjtnyue42da6zltxpai2hlod3verxbkecbmmaw2ktj@6qhufjoik7kw>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pTZfuJSGYj6Rt4xjq2QkcRmKZT-0wXm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX/AiyYHgQuwXK
 ExxbT71FiP/D7nycJPhhsup9E88Tgi4xuj1aieAxRw+BzHnaepDns3CJd+c1WDhl1ZWSL8uTSHZ
 hRogLoWiqCdKof/NFTLIpRuDn/pOk015ap+U2GeMQa48biyzuXX5oVjOj9wmwhWxvl6aQQqlIsD
 Z34MkXukpZFIR6yJ11TnQwgwjOdyxhof+84jSd1K8eqZ1gXhQxEscxU94xv5oUmr6LUOMrJWf8I
 WQ4lybrxZco1qXDvrQ36vb6Evy5IvXKbADueeWkTKnblbbPOAHKF9j93OfCZwz/ZL9rcSW3L3A/
 4nxae6L79Xw9JkNAy/C1lmbZXC+3iUwfCuTP0Dmi6Rj3wbmhC1JgNtBlYl4ByAZf8Vs95ZQnkPe
 NL0HXifuicJxzmyWLL1uO65h0cERgW+ehaJ1p96WWDAwLTIKhY20c48m0ZAcSgfxE9kRM93chCy
 7tqrctaCQfE0Gx+pWvQ==
X-Proofpoint-GUID: pTZfuJSGYj6Rt4xjq2QkcRmKZT-0wXm0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3EFI7akA8fum
 a26qEgCg5XzWqgg50dRpef5YLW46H4mRyzN4oI5E9096CpEC0GukV0D9Mfh+RmuuA8Glk5rpl0q
 AasrLbP6dLnQAhXSa9TfyLu9+hBUQhI=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9eb556 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ci_LbjHFLAaaU83jS4EA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On Tue, Sep 01, 2026 at 11:49:42AM +0200, Konrad Dybcio wrote:
> On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> > 
> > Fix this by using the rpmh_read() API to read the regulator voltage
> > settings done during boot and make it available to regulator framework
> > from the very first read after the bootup.
> > 
> > Also use this API to read the mode/bypass settings as well. This will
> > provide the regulator framework a sense of the initial settings done by
> > bootloader and thus preventing any redundant writes for any setting post
> > bootup incase the same setting was already applied during bootup.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> 
> SC8180X Primus hangs with this patch applied and so does SM8150 HDK.

Ok, i did see some issues on SM8550 but those were mainly related to the
voltage range check leading to some regulator failing to probe, for that
this below change may help.
https://lore.kernel.org/all/20260720-b4-regulator-core-clamp-voltage-v1-1-8e5eec076a8e@oss.qualcomm.com/

But i suppose you may already have it?

do you see the problem with the rpmh_read() or in the voltage range check?

> 
> Interestingly, SDM845 DB845c doesn't
> 
> I think we may need to opt some platforms out of this..
> 
> Konrad
