Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793303656;
	b=UnxBMtP2plZAUJWn/fWcmScDnQDBnpcl7bpPrEvslIKnuoqa8L23hKcAzyr91Zh4Fj1q
	 23aFfuYlobIzoRZ9bCFEKlu3Znb/6Tk0FRE2JPcGIPaWOqIrdroTijwPs6PehpL9ESXIS
	 ANeouYRC0chMBcjoESidZ/75DAANvH7mTRHa11M8zjKW2zI8kDG6DT1gjkeyA4C4/Oeh+
	 J6zeINEy/Yjo/uqItNZLLf6iWHkcfpuwdRF3NJleVFSIdu2FzMxCvVjS0i8jrREYsn9ca
	 PSMPzKpZq7sWwIG+Jcf1zCcZ2kj4aj2BIP0pXi2GfcbhYkMP8r9Zph0JJobFaUeFXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793303656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=;
	b=5myJmh+QN65kNpYPGlLZsHM8lrhrLzzUQLHKFPa7U9ngUw7/uGgCuri3p3ovqHfni9FO
	 7NpmnhESTUYWU9J+TVgNYxXXcEnDNZEIgEXMk/BZJrTzQGfBFLXiiRTMWiouYvi2BVyy8
	 lzZnVPym/XPVpZBGXEaWiXekxMLcXX5ZMQiq9LVLaik1SG/Io7gZttG+bnTV9WvJ/P2W/
	 GQYeyBIp5fmZcheGDRY0gx2mRO+mElDrTIQSZqsMLmKKsDn55zGcU3OIci4AMS4Nc/FT7
	 rah1EgNxRsiUhhNtS3RIOvBu/4WYPTbzYPS7eCwnbnNx7oH/BqThqdTJkgqGa0kapDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S18MoNtY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKWcYaN0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C282606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C282606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S18MoNtY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKWcYaN0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjYMZ2138366
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=; b=S18MoNtYnF0DPxYH
	rt5TeDF+t4EFOtcw2oVcG692OF78JHQ31g+KQP7jsWAj/fYVZQs3TDUAgFC3HsmK
	sFrSg0U+AXPFZM0ZV2JxC4QwePMfagvvxOBsxwzmb9omBGMxNMzW+FifxMxt37RH
	HmPWCgEC4iede7vrSCOqsmObxp6zaQMZ8NkU7LqwppStpPdB3lA6dvgoVOziXtr4
	tMF6FTMsDl07BcK49MJSjQDo+2nKh+2v2ywnzYpKUCXZK+sVzkOaRwQfAL/eB02M
	l/9gbHloF/lf4y06GZ/ZLTJpAPNHWNVk39i7GeVG6YusllkWBI1wpo7ikpjwjaw/
	yb0f8Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a22h92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:54:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so7567602c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793303654; x=1793908454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=;
        b=WKWcYaN0vfUtTmtVXC8dP6bRgP7ov7u9tzW3AHQhdWOVPCiVg+AHvQpr5oGbAWJyab
         y0DlZ9xB831VWboE9Di8d2mOFFVJZNLDCyxRnvYF0k/LYT24XCatcKgTMU7u18UM4iRq
         BQMSmBFKQoEldDbk8rgQ2PjlqJTusE/+sBPpKunjH+TDFI3LzQX/3QTczYLm65KbmDE2
         b4GpD2YdT2deCwQ/BAaz/wk/2o09NJ/DUlA5GLC2VS6zGvmUCe0eeH3mZffghRy2Fc/0
         GNo5tOVb9VnfzxUQPbPcQcG16QOhlWmfqzIHFg0bekztQo3V3JXCopfWPa0o+qltIrQf
         p22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793303654; x=1793908454;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFFb3xRbTkC9aLT6iKW9nx0TecH0j9KTJlyuglwJlq0=;
        b=Xh/i7dNA/2kApP4MefRx2BpWSyzAREcH0KfdPA0H0KXFf9E+/McRwplMRh3oVHiD3z
         rNAtwxWb3H14QJd7sD9xYn2ZlrOFAMcJFDzGWc+FXJM0kqIBFPrKlCimRa4zLn1BuGWY
         mh8foIJP2Yp4Wj2X3ismB2zmSvIKUw2FlNygL2S5tHcIVsEbr+FrgOT8hi1hXOor5qz0
         OTHByXhofxjoBwoFx6ATpn0kgRDDw0k3f35FkQRH28yUBmhJj5Einol6t9N9xLT5Iu6g
         5rJzFQEulRLvtkknEHG5PdJSH1HiD8Hf80mdjDMqr2GUNpXD4JSP2TUAxbOODUltrfh7
         GOVw==
X-Forwarded-Encrypted: i=1; AKwUvBzYBIA671b/nAcW5elUuKW9vkCuPPsxJ1UU/HXVkw0gFuWZM6ITrxFJ8xOyDLwdAltT43eD8nuhA6Cn5rY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9ZDrGJNhy2C/ROmJWGBpqUi0LleIHRzILyk0LDaAPnvc+DyrI
	p+4RWUK0WpDtery5B0fVpqLrdl7szMPBlzgsNIUn8NHMOlm2F1LkA3sq7QtXg/80Le79jJstmwF
	zo337HkOvHj8Mdr4AETANysR/J0a+3JQpUAo63+I6myb2TO1Oi4l9eO3ICZhuw4RzutY=
X-Gm-Gg: AYBFou3VKvpEIMgwzMe7G7Vl5CN8VTLE3vJBqDmccjImWYlMufhMgyvjY/6oGDklhBD
	6gOwUJXZJzikNrE2Mi0d9+UBtbQmZmbkM2aY4JEcoEKy0u60+z3D3cdVjJ9t8c96v0658cwWQr+
	RnRElDtJXc1CWKfQpo8+YxXKswqL9wLiZvcDPO1f7Lnk80WJfFgOlA1dyHUll2H/ZPYdmQ/hW2E
	EvWsG06j98Jq2gs3gzXebGXlKjlqL2Bptx6RQ4nNVt1nhrQ38+Zbym6inwN6UNoPzWBxTbGJVB0
	TgVkrglwaxinfbCNGuz3vBBkr8rMCwnmRuQTK63eJ8+u5X3j2pot81OsrwcS9u6AjGIjVEBe07s
	OQQk4oaTpT8eBvhAdq/dkT82d8SncXmR9OG667FxyRPKFImliz+9iKInV/qUX05QlKQo01yDc0G
	A5A2Ek1kMI8kbdQzniaoKY9ZZ9vxWsiT8=
X-Received: by 2002:a05:701b:420d:10b0:184:d593:2897 with SMTP id a92af1059eb24-1ac5d5aa2aemr43879c88.29.1793303653326;
        Thu, 29 Oct 2026 12:54:13 -0700 (PDT)
X-Received: by 2002:a05:701b:420d:10b0:184:d593:2897 with SMTP id a92af1059eb24-1ac5d5aa2aemr43822c88.29.1793303652436;
        Thu, 29 Oct 2026 12:54:12 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm762056c88.20.2026.10.29.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:54:11 -0700 (PDT)
Message-ID: <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 12:54:10 -0700
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
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfX80pLVMI2c2N2
 4qIHSBjAef6l3tD/Mu53mKii1hB4azcV1xVvF4PkJwbD0G0lxdapeDFBkidQdMriJNdXQ7QSbpr
 rcyBAb+d+8/lWs4pP2mXwBXnOVA9fN3xzXr9k8Pf0o/KuTIULyf9GAhrnwUZRxFaXdzp8XbbBWI
 22ISlTEF+ZIC2yI0NijNhAqdL61Q9y8lz1kyschVVPjOSLIT0vtXJmqs5jV0YBuK/WejzN+9S6r
 wdQc6aO3AHie63kyu1fVn6UUHvMPVmHQajeihFLhMLiwZMhsmusmgG/P5+TczR4PnyNsNWu2KvQ
 yS0/do6/sMgnrCrf8T5/ElRIjgbGqcxvqIebTNY3XV+AmHUl8Sjgm9BwGtOBwjLYXmECY3uubSt
 PTQkFX2+FWY6FQ6ZBLxL8P4MCaESIwYaZyNAz46uKv7rXrsVfpr9eViyUYd739fAHczH1RizJ+c
 FcLdKFRsFgzXiCrCX/g==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3a466 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=_EWzUorPW55NH7C-jDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfXyWSmBjuhA2Ou
 mSzNce/uAUukFvYy2LcpPfnRW+sDp24OYhxuHoIaXzWv25d58ohwX1ivTkB8crWaonQh6SYzU7C
 IFwx0N7Xw9zZbW80vLW565ziWAtnQGc=
X-Proofpoint-ORIG-GUID: dxq9wktW9dONFfXe8hY0KyLWpehU3u78
X-Proofpoint-GUID: dxq9wktW9dONFfXe8hY0KyLWpehU3u78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290078

On 10/29/2026 4:11 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.

s/ararys/arrays/

this removes a lot of stuff, by review agent says there is more that can be
removed...

  qmi_wlfw_v01.c
  - static const … wlfw_mem_seg_s_v01_ei[] — line 188
  - static const … wlfw_mem_seg_resp_s_v01_ei[] — line 229

  qmi_wlfw_v01.h (removable once the two .c arrays above are gone)
  - struct wlfw_mem_seg_s_v01 — line 161
  - struct wlfw_mem_seg_resp_s_v01 — line 168

  qmi_wlfw_v01.h — now-orphaned size constants (0 refs)
  - #define QMI_WLFW_MAX_NUM_MEM_SEG_V01 — line 64
  - #define QMI_WLFW_FUNCTION_NAME_LEN_V01 — line 67
  - #define QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01 — line 70
  - #define QMI_WLFW_MAC_ADDR_SIZE_V01 — line 76


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 826 ------------------
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    | 249 ------
>  2 files changed, 1075 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> index 279aeb2a7dbc..dc0f7e353349 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> @@ -569,64 +569,6 @@ const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   pwr_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   pwr_pin_result),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   phy_io_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   phy_io_pin_result),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   rf_pin_result_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
> -					   rf_pin_result),
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_wlan_mode_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> @@ -1148,302 +1090,6 @@ const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_initiate_cal_download_ind_msg_v01,
> -					   cal_id),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   valid),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   file_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   file_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   total_size_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   total_size),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   seg_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   seg_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   data),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   end_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
> -					   end),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_download_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
> -					   cal_id),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
> -					   total_size),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
> -					   cal_id),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
> -					   seg_id),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   file_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   file_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   total_size_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   total_size),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   seg_id_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   seg_id),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   data),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   end_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x14,
> -		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
> -					   end),
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_msa_info_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_UNSIGNED_8_BYTE,
> @@ -1553,195 +1199,6 @@ const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[] = {
>  	{}
>  };
>  
> -const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   offset),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   mem_type),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
> -					   data_len),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data_valid),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
> -					   data),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   offset),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   mem_type),
> -	},
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   data_len),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x03,
> -		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
> -					   data),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_athdiag_write_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_vbatt_req_msg_v01,
> -					   voltage_uv),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_vbatt_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
> -					   mac_addr_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = QMI_WLFW_MAC_ADDR_SIZE_V01,
> -		.elem_size      = sizeof(u8),
> -		.array_type       = STATIC_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
> -					   mac_addr),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_mac_addr_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
>  const struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[] = {
>  	{
>  		.data_type      = QMI_OPT_FLAG,
> @@ -2024,286 +1481,3 @@ const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[] = {
>  	},
>  	{}
>  };
> -
> -const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
> -					   mem_seg_len),
> -	},
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
> -		.elem_size      = sizeof(struct wlfw_mem_seg_s_v01),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
> -					   mem_seg),
> -		.ei_array      = wlfw_mem_seg_s_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_DATA_LEN,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
> -					   mem_seg_len),
> -	},
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
> -		.elem_size      = sizeof(struct wlfw_mem_seg_resp_s_v01),
> -		.array_type       = VAR_LEN_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
> -					   mem_seg),
> -		.ei_array      = wlfw_mem_seg_resp_s_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_respond_mem_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   cause_for_rejuvenation_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   cause_for_rejuvenation),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   requesting_sub_system_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   requesting_sub_system),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   line_number_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_2_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u16),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x12,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   line_number),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   function_name_valid),
> -	},
> -	{
> -		.data_type      = QMI_STRING,
> -		.elem_len       = QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1,
> -		.elem_size      = sizeof(char),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x13,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
> -					   function_name),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[] = {
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_rejuvenate_ack_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
> -					   mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
> -					   mask),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   prev_mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x10,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   prev_mask),
> -	},
> -	{
> -		.data_type      = QMI_OPT_FLAG,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   curr_mask_valid),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x11,
> -		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
> -					   curr_mask),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_8_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u64),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
> -					   addr),
> -	},
> -	{
> -		.data_type      = QMI_UNSIGNED_4_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u32),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
> -					   size),
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_STRUCT,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(struct qmi_response_type_v01),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x02,
> -		.offset         = offsetof(struct wlfw_m3_info_resp_msg_v01,
> -					   resp),
> -		.ei_array      = qmi_response_type_v01_ei,
> -	},
> -	{}
> -};
> -
> -const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[] = {
> -	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> -		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> -		.array_type     = NO_ARRAY,
> -		.tlv_type       = 0x01,
> -		.offset         = offsetof(struct wlfw_xo_cal_ind_msg_v01,
> -					   xo_cal_data),
> -	},
> -	{}
> -};
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> index 8d4b929e8437..c0b2eaea4dbc 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> @@ -240,18 +240,6 @@ struct wlfw_msa_ready_ind_msg_v01 {
>  #define WLFW_MSA_READY_IND_MSG_V01_MAX_MSG_LEN 0
>  extern const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[];
>  
> -struct wlfw_pin_connect_result_ind_msg_v01 {
> -	u8 pwr_pin_result_valid;
> -	u32 pwr_pin_result;
> -	u8 phy_io_pin_result_valid;
> -	u32 phy_io_pin_result;
> -	u8 rf_pin_result_valid;
> -	u32 rf_pin_result;
> -};
> -
> -#define WLFW_PIN_CONNECT_RESULT_IND_MSG_V01_MAX_MSG_LEN 21
> -extern const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[];
> -
>  struct wlfw_wlan_mode_req_msg_v01 {
>  	enum wlfw_driver_mode_enum_v01 mode;
>  	u8 hw_debug_valid;
> @@ -365,72 +353,6 @@ struct wlfw_cal_report_resp_msg_v01 {
>  #define WLFW_CAL_REPORT_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[];
>  
> -struct wlfw_initiate_cal_download_ind_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -};
> -
> -#define WLFW_INITIATE_CAL_DOWNLOAD_IND_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[];
> -
> -struct wlfw_cal_download_req_msg_v01 {
> -	u8 valid;
> -	u8 file_id_valid;
> -	enum wlfw_cal_temp_id_enum_v01 file_id;
> -	u8 total_size_valid;
> -	u32 total_size;
> -	u8 seg_id_valid;
> -	u32 seg_id;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
> -	u8 end_valid;
> -	u8 end;
> -};
> -
> -#define WLFW_CAL_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 6178
> -extern const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[];
> -
> -struct wlfw_cal_download_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_CAL_DOWNLOAD_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[];
> -
> -struct wlfw_initiate_cal_update_ind_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -	u32 total_size;
> -};
> -
> -#define WLFW_INITIATE_CAL_UPDATE_IND_MSG_V01_MAX_MSG_LEN 14
> -extern const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[];
> -
> -struct wlfw_cal_update_req_msg_v01 {
> -	enum wlfw_cal_temp_id_enum_v01 cal_id;
> -	u32 seg_id;
> -};
> -
> -#define WLFW_CAL_UPDATE_REQ_MSG_V01_MAX_MSG_LEN 14
> -extern const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[];
> -
> -struct wlfw_cal_update_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 file_id_valid;
> -	enum wlfw_cal_temp_id_enum_v01 file_id;
> -	u8 total_size_valid;
> -	u32 total_size;
> -	u8 seg_id_valid;
> -	u32 seg_id;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
> -	u8 end_valid;
> -	u8 end;
> -};
> -
> -#define WLFW_CAL_UPDATE_RESP_MSG_V01_MAX_MSG_LEN 6181
> -extern const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[];
> -
>  struct wlfw_msa_info_req_msg_v01 {
>  	u64 msa_addr;
>  	u32 size;
> @@ -477,71 +399,6 @@ struct wlfw_ini_resp_msg_v01 {
>  #define WLFW_INI_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[];
>  
> -struct wlfw_athdiag_read_req_msg_v01 {
> -	u32 offset;
> -	u32 mem_type;
> -	u32 data_len;
> -};
> -
> -#define WLFW_ATHDIAG_READ_REQ_MSG_V01_MAX_MSG_LEN 21
> -extern const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[];
> -
> -struct wlfw_athdiag_read_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 data_valid;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
> -};
> -
> -#define WLFW_ATHDIAG_READ_RESP_MSG_V01_MAX_MSG_LEN 6156
> -extern const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[];
> -
> -struct wlfw_athdiag_write_req_msg_v01 {
> -	u32 offset;
> -	u32 mem_type;
> -	u32 data_len;
> -	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
> -};
> -
> -#define WLFW_ATHDIAG_WRITE_REQ_MSG_V01_MAX_MSG_LEN 6163
> -extern const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[];
> -
> -struct wlfw_athdiag_write_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_ATHDIAG_WRITE_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[];
> -
> -struct wlfw_vbatt_req_msg_v01 {
> -	u64 voltage_uv;
> -};
> -
> -#define WLFW_VBATT_REQ_MSG_V01_MAX_MSG_LEN 11
> -extern const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[];
> -
> -struct wlfw_vbatt_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_VBATT_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[];
> -
> -struct wlfw_mac_addr_req_msg_v01 {
> -	u8 mac_addr_valid;
> -	u8 mac_addr[QMI_WLFW_MAC_ADDR_SIZE_V01];
> -};
> -
> -#define WLFW_MAC_ADDR_REQ_MSG_V01_MAX_MSG_LEN 9
> -extern const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[];
> -
> -struct wlfw_mac_addr_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_MAC_ADDR_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[];
> -
>  #define QMI_WLFW_MAX_NUM_GPIO_V01 32
>  struct wlfw_host_cap_req_msg_v01 {
>  	u8 daemon_support_valid;
> @@ -584,110 +441,4 @@ struct wlfw_host_cap_resp_msg_v01 {
>  #define WLFW_HOST_CAP_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[];
>  
> -struct wlfw_request_mem_ind_msg_v01 {
> -	u32 mem_seg_len;
> -	struct wlfw_mem_seg_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
> -};
> -
> -#define WLFW_REQUEST_MEM_IND_MSG_V01_MAX_MSG_LEN 564
> -extern const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[];
> -
> -struct wlfw_respond_mem_req_msg_v01 {
> -	u32 mem_seg_len;
> -	struct wlfw_mem_seg_resp_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
> -};
> -
> -#define WLFW_RESPOND_MEM_REQ_MSG_V01_MAX_MSG_LEN 260
> -extern const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[];
> -
> -struct wlfw_respond_mem_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_RESPOND_MEM_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[];
> -
> -struct wlfw_mem_ready_ind_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_MEM_READY_IND_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[];
> -
> -struct wlfw_fw_init_done_ind_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_FW_INIT_DONE_IND_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ind_msg_v01 {
> -	u8 cause_for_rejuvenation_valid;
> -	u8 cause_for_rejuvenation;
> -	u8 requesting_sub_system_valid;
> -	u8 requesting_sub_system;
> -	u8 line_number_valid;
> -	u16 line_number;
> -	u8 function_name_valid;
> -	char function_name[QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1];
> -};
> -
> -#define WLFW_REJUVENATE_IND_MSG_V01_MAX_MSG_LEN 144
> -extern const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ack_req_msg_v01 {
> -	char placeholder;
> -};
> -
> -#define WLFW_REJUVENATE_ACK_REQ_MSG_V01_MAX_MSG_LEN 0
> -extern const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[];
> -
> -struct wlfw_rejuvenate_ack_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_REJUVENATE_ACK_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[];
> -
> -struct wlfw_dynamic_feature_mask_req_msg_v01 {
> -	u8 mask_valid;
> -	u64 mask;
> -};
> -
> -#define WLFW_DYNAMIC_FEATURE_MASK_REQ_MSG_V01_MAX_MSG_LEN 11
> -extern const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[];
> -
> -struct wlfw_dynamic_feature_mask_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -	u8 prev_mask_valid;
> -	u64 prev_mask;
> -	u8 curr_mask_valid;
> -	u64 curr_mask;
> -};
> -
> -#define WLFW_DYNAMIC_FEATURE_MASK_RESP_MSG_V01_MAX_MSG_LEN 29
> -extern const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[];
> -
> -struct wlfw_m3_info_req_msg_v01 {
> -	u64 addr;
> -	u32 size;
> -};
> -
> -#define WLFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN 18
> -extern const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[];
> -
> -struct wlfw_m3_info_resp_msg_v01 {
> -	struct qmi_response_type_v01 resp;
> -};
> -
> -#define WLFW_M3_INFO_RESP_MSG_V01_MAX_MSG_LEN 7
> -extern const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[];
> -
> -struct wlfw_xo_cal_ind_msg_v01 {
> -	u8 xo_cal_data;
> -};
> -
> -#define WLFW_XO_CAL_IND_MSG_V01_MAX_MSG_LEN 4
> -extern const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[];
> -
>  #endif

