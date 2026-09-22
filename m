Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835FA539762
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074941; cv=none; b=oI+boeBteiI7URKhSuA1X/ZdSvOaEKpsaXRhIU8lU6u6ibXtUOTxcUlpaLsvpyK+ZJiIo9OvmF4AbxUQR5XT9AxyohWezFSBmLlwXc6QLFUr3F+p7b5UC5BhryjfhopxNwc8UxiIXfNHG4blMHgHyyeuYb3Nntk0Hr+2HAo11dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074941; c=relaxed/simple;
	bh=c/gHB78b+REkg1KShrJuw/VfjHzyhX5Grd/Q9g073SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvFPff50JOeQYRGDCv84BiEx+bHHlHWcFOTT15YrKQfnbnX9KoIOBv1uqwKTAY009TNdOE5qKdsPJk6Y4cIPujGz/ZgWemZ9rMN2xzRgmp980ioJcKoaAcJzC0kGwJyVELTp55B5RYr94WL07ZtXKIKg+YXVowU5jEeubggiEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/9/FtWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILF92qxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/9/FtWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILF92qxi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7pIr02173113
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=; b=O/9/FtWxxKdesNdn
	X+jhngUM6a2s+f8cRg9BnTHs2IB1PNnBRiC1xXp4TMMwDFbYjqQ/N3TVfUQJW8sk
	zME2nth6+gxZpgbZ3yvB2MeeqBAD/tYgO2iRPyrrbkFNoGL8sq2Y3s4l5jgI2qX/
	uUHppnv09sG4NdpeT5LckSjZU3vI5z6hwxhRw8QYWBawGSRVF+v6R51JZFtrOV++
	3lByHLhyPB8ufyRl5Eh5sry7IL8HqFOTY19Y1dQHC3g0rKiW2An1/8k+OYB3TLSD
	rrVbvgu1cGLnMQMVey4MDWaNNa42OakQEYZLFaQ5C6rW7crCZ5Y+qfEXn5g95DVY
	8PSBfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqa268-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:02:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3730958a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790074938; x=1790679738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=ILF92qxiwSiAjTQp/G6nz+a1SiO+Rc9EkC7CedMsPSIzC196H+nLq8AwGrdVAKVyp5
         CnG1ONV7MAnz/sqUWVCfxnd/dqmJBdc0g27oAVJBSbYFgcEXM0jSwzz0R+gvVnp71Q7o
         WnHoW9PNv1apOH5OGtWkIymu261Jkg3ollf+mkikN8a3+4QvcCkvHRGdP7u9rkBbJBHX
         L3Jnyvi+wAYaaANA9f0FIsCBQFcAblINvLluxOGJ/yvPHbdiBED7bcKwWZWwUAfdYk9G
         C69KKTk7gVrFCREGth24iLie8CchwyGjSQ/nG3IAvfRTSxaBGIUDWG5e/gGslsmMpYtu
         +hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074938; x=1790679738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=CPcioQW/61U44A33eWnKcQ+Jf8MU6bMJ4gKlmCSkoHmbAil7VINfu2wdF93MRPGtPE
         eHI8ko+i8y3nJGdwCNY6NUmxem4q3RmYyoC9elLec0S5Ih0bXdXaH61xpD8FV+pMn6Ru
         WicwWazHAc09bymQqkXVnr1+HA1rmIU8erANvZtdh2K59bq/BeVSrSpDZv8dj+qBUGmP
         Vs7iurYesmbLk6/pNbu6h35t+xmXfV04QibPdA7BLxQOf4twOL+DjWLfP5qH1KslQR7q
         ttI6lntXLyqsJz3rwUnQOWzeT5IUbnfE2xIcmY/Wpiao0MvLrdE+xv+bAD08ikek44sQ
         XNfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0QU6pvGKuFY5+dASkDqWHXMH6sjd/wEYN+WJ6wWWKTmPP8MJpbCsqnOfxSBIZ5cuWgS9/xmBhG3paqMY=@vger.kernel.org
X-Gm-Message-State: AFuF++mAeMzaToxuF7lpzu45wTSOCK7PdHkgbb9mT8lzjhFh0X5qqV4u
	YAXVlph66ujrnfEnWi2XLUpPNLytIvcR0eCtO63VGjPXTSrnCKV8a9Xo7V/JpzHwfdPIrRIhitZ
	4w2xqOstIZBmrO91SNui4FrtfAfPZoTaVP5bXw5aM8lXwBoVk/jFkz5UCggLfHcZePJ8=
X-Gm-Gg: AYBFou2mnviVxdilcvQmFnWhQwiug5qNE8esE+U4w4ILR5UsTDN8qOjC+KzcuCn//1r
	muJn//Xroh8buobatak7iGBqiIBEUREY49If2v3wMxc3N3yI3Z5vqfq1/piT88Uz+/Htw7mns+Y
	Keozabe9RqvktnrRBB5BtX++ZPxttAJLbGrSk1CUNgV/llnK+mRIMqHmNvPjWx2MiS7tB2eDfEL
	fT1kDmsOpbwtHK+ZOzL1/rxEoFalkw3VH/hwHPYYpYqsIoDXpNZsqKAwsKXE0aGOWLVETmVrvet
	Nmo+yo6BK053A3ZrqRCGMpZTyE87/mTw1HsWrEl9DBaAnYS/azRrVWm9WH2uL0oev+YA2ZFmTx+
	x6ovOsAQnkzJGieN+P0TLfFEGOgFRMxbUZcWXx/oLOko/nUc=
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919703a91.47.1790074937860;
        Tue, 22 Sep 2026 04:02:17 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919631a91.47.1790074936903;
        Tue, 22 Sep 2026 04:02:16 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm7775851c88.2.2026.09.22.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:02:15 -0700 (PDT)
Message-ID: <3f31a185-b7ba-4ae4-a3c3-874bac0d66b3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:32:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E_1LU4Ta6-wod_CtOGALhFdeEHybXx3A
X-Proofpoint-GUID: E_1LU4Ta6-wod_CtOGALhFdeEHybXx3A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfX6PJD4h1oDjEx
 HwAikYFdV8cJVZJCFDaPw7FKQY/9LAu3ntk4GzCBS5lOcfWA0VttbkhIlkasZUAmiC885R9R1SM
 x201t1RRZAdaMcjvorJNgG9AprzIBsA=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2603b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uJV0Co7Z9vYWId34oq4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfX+5n/8na2kmLb
 3RnfwSHJkQyAF+5o4jjskpkdw+lDG1wy66qKKxtwCTV1WuGhGJa2TC+V/gZ5GFnZyHqUJizxbKA
 Tx6AK8NAuS5qHq5amzQSc66gSCFQxk73uqHUu51PCJZriKZlAVzOqSWMP9DnpyDT8YxWBMRbWHy
 +p/v1UOWAixpBMuLhphXTRNZTv9qUCpNpsDL0mM3wBlX1g7XTrYon2WYCX2ieGRMnNcEVBjfPpc
 fNGAAXy5k2FMrZ7NGa2VgYnW/9tzwtmNpN2NslI6kzwhmJ4aEcslwYPfJ/nFMD86g9aIn8v4aGf
 mdaETV3H2h5CcDBOx5N4SeYOynejTHV3wJ1i3ek1OMuJU7eagNJ5ZkELEZxosnkWCHLTh5y62in
 eTx7V93qpRzZWIFgjPfG3V7JznzfccnHMLjis8vx6IvWcGDwXQIX1D3MGGNy4JeBVqVda/NaFdz
 NiiD+270xHZLAXq4x2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220159



On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath11k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
> index 017fed1b4bd1..0da9025c7ed8 100644
> --- a/drivers/net/wireless/ath/ath11k/hif.h
> +++ b/drivers/net/wireless/ath/ath11k/hif.h
> @@ -32,6 +32,7 @@ struct ath11k_hif_ops {
>   	void (*ce_irq_disable)(struct ath11k_base *ab);
>   	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
>   	void (*coredump_download)(struct ath11k_base *ab);
> +	int (*get_qrtr_node_id)(struct ath11k_base *ab);
>   };
>   
>   static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
> @@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
>   		ab->hif.ops->coredump_download(ab);
>   }
>   
> +static inline int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	if (!ab->hif.ops->get_qrtr_node_id)
> +		return 0;
> +
> +	return ab->hif.ops->get_qrtr_node_id(ab);
> +}
> +
>   #endif /* _HIF_H_ */
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index a163168f3617..4d327b5cc98a 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -10,6 +10,7 @@
>   #include <linux/of.h>
>   #include <linux/time.h>
>   #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>   
>   #include "pci.h"
>   #include "core.h"
> @@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
>   	return 0;
>   }
>   
> +static int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);

nit: since qrtr_host_node_id() returns node_id in unsigned int,
may be maintain that in the return type of the callers as well.
Mostly harmless as it is unlikely that node_id is allocated with
an extremely high id. Either way is fine with me. Same applicable
for ath12k patch as well.


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
