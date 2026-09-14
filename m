Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393134F497
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378797; cv=none; b=plxn/P+P0Yupx0bPKonhqHEV463ZNm8M2OHLv4F3c2EP0UYCt+snlHZX5sOTCd+1D64ESepRLpGHRRwQjkHOH5B4z54xEZQKAIlHIEla8bMARqCFgXj3TKMzkc5lIWKwd2/XEGe6kQIxp8Pnji/15qrjQjTOoXXAOMlix8Rg3hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378797; c=relaxed/simple;
	bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyL4mqKhqd+6IgqCZ/oCfKXxpVv7CUcWuCb6YXKLN92XAnrXE/dVM0j6kYkXjt4316luRY0puxuisU4G1uWHB5WnTFqMCaL3rmk7i4dcOxMqPb1XZNNTDcgKDEeWlXVK5QaXlokiVZCgBlwBobCPzbFztSTkQbpA4qdm9WtZ/Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvCGd3b7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTfQ6IED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvCGd3b7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTfQ6IED"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E803343490574
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=GvCGd3b7ibiXNVov
	KGk6RyollppYoLgluhcTje2RH00hvnrzULm+sVBo/9CjHL+KQjbNG7+UrSm5TsFp
	oDOW2/+AxLOFkLsnFyyZ/iUZ0JqyZhsQGdTqE5dhQKAAaXUdLcRN2U44iHuYtkMS
	8AcygZtX6xVz68/d6aGC4UKivxT5syVmOcfHu2sxh6tXutAQJAbnT3AdODhGYo/x
	Ks+kk+z+IODcVD+rVfd/4+SvzgKpaqYXWSJ3ufqqb+H1N7I/+8ge+GUzwpCm+Pat
	2OkaPc/Ms3op9Fbt/JqvBejUjxVCYi3ccjEFJGgV58PdtfQs9kMiaILbHNEYL05q
	gqrHPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0b3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3785729a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378794; x=1789983594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=XTfQ6IED3XWE6vhSXWto28D0mryfLZgD1lBFtb8I7TlTJlj0s2RaHYxxWFraR9GyVD
         4MMvpO6UZffXYBaRvVBiqPPYodlI0L/1esptKCMwXQFJxMIw0uESDkE08WfHZhIBG0vR
         Qn/+AKbFuw+uuqU+XlDqBWpj7i6ZOgM83qDTMbnKWHcl/vGfdfwV/dnx6B+7d64aCqRJ
         Jgx1HYIXcyPv5cTKANvmwT95lJ4RY6xxs5rWdXEkKlaPBxNPf0sbtPbTqB8856tToiA4
         eav8WEvACmYiExvBqGGKZcvyabnCYsMpEKYvRPY0l4IYz2i4hIq9TCoXre4zaSKChSC+
         IPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378794; x=1789983594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=nqrNZ9Fs/wBbSPgC5r3hmzTkDYgF2wrhkv5oABdErR7+vabHoyUQnc+Ns1CkMx9Zgb
         8YbMxA4VKaq5eAnSEKfNPg1RvU6UGtERc2GFl0e4L9pLt9ocsyiUX2osiZTYWAzSxsXU
         5vXVaWBtSiT5f2GkXW8lIwLzqtP8W27rTfD/70W/2nbFDUofwjo4MUi+Dm/PyGmtaAge
         h+TH2Fk9ew86gs72rg5UBRqN7Ro6en6NYLWvxtxDlxuimwj4Jnm0vZkREHaLvl5SEBJi
         5FR30lqhbyKUCHeGr16DIjYbHMkTbTNUfqd3kJP0B9djLW6sKnROyMLESdIi7xEmy3Nx
         m9+w==
X-Forwarded-Encrypted: i=1; AKwUvBx7X1lU6QRa+U9b2g6QUwDsT4nE7OgNeDGD6/ipnYQbKdqXNj0pKI9Xlx5ubJHwaw1EKlO1PgC4DLrM1Z8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Hx2gnjEEy9rGrTAuxUd87bQSEWBZ/yz50jjcgJWBNg1NEltF
	KRTBSYjazAC6T2Go0ySV09OTA8RWLwDanIkRtoAjWOVNoEKwAAyAXN1bPqUaLX5kMvuGo0Zxk82
	WEQGyjS/kHpfQ5FQ4C9ckLaxeEOuHIg3KJBFkAk1WCpTuj9Xw/nishzjkl6VjRB08+/0=
X-Gm-Gg: AYBFou3tMaiK1uvTeaIBk4Cb5cFx/tYBzzS8WH8WXsWx45gHk6x11GVfgzDsSgonTtF
	RBRt1sUyWbtv4t2/GvV3r138RR+m2zLUwyYmQopeRjbmHjoGJYkFncbCwZgw9h1BKLtDHRJ52sQ
	SoUEBONkXCGTsnNDDt2wMeWfqlCVII68IydewtLkaGvkIjy6vESnTCKKSnuq6RHNTEfmIoUJaiO
	tiWDQbJySAaCI41Ic/uSo6m4V01bYVvmWXjnJOMNDA8V5uNHSv48o7u35giluSsn9LXpcpxw3uD
	QIWkDm+Jf6Q+/FR+MQXPnDZzAfE5gNGZCCziPbYHljpXVENpvZ/vGpT4tyCbs4OeXy2whnLkmhK
	Ve6iesFbINs1aYZ1NulqNmI/JJEkIZW/e+NpED66cXeB32l+fTV2K8y4v
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901795a91.22.1789378793860;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901732a91.22.1789378793357;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:50 +0800
Subject: [PATCH RFC v2 02/10] arm_mpam: Fix MSC MMIO window size off-by-one
 with resource_size()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-2-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378759; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=580EJYrRRaQFaJTBhTGLIBPMftpDItwYKFFvVgVOBnIGXre3jEMO3P5n/lbQty+QF8/WDbE3x
 ujX3TeCQLrkC8JlprOX1id1zXH56ewGS0cLUd3xaxTFVmX6xlGuwBU3
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: SgTeJ-_-YansALl_qcZIzbnDO7gmyHkF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX3pEiDoecENV9
 RyQhY8tC8cdguz6ynzPderl3H6ewYArFjB86GeTySN7cy3lBwedAvW+LQg5tounYhV0pb4c5lH6
 M9mP2bjnx0VCtAntFo5VWx7ljxUj6ow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX28zulKvv0gtk
 BO5mMLYqcmZRlifrzsIafyf/0BFleVeEJvFwGY2icHQkO66cEWQn3Wfr+EhlQi5QUb9PriR+M5r
 5oh5eBtv6YY2CxrDG/jcv91cKoMcp7Afe9M/kxDUyTv8flrJ7Ssv3MIY1l4jkCZDrwrEOHDPSS2
 4n/VwgYwwdnzxemO97PhkcKigzrhTF4dcI9Yx4+7DZXOh80zMHX0Yp3G7u+WzxG01e9greoeaC9
 0Aq3syckyqKCPcSoDFUCHIN/uwaxZ8uO6ySY5PGBW8MiKBb7y00TsFtGXhgfcPEvi7Ot4rgtizu
 hgYpJE/zWgAKvG4rzHJCk6+cXchZ3KTjlC21AVIFBpzWwvKs3NPMHmuGV/CvE9/3r/kZ+tFwTSo
 nn9/3OBQWVd4VXxcEtn6M8N73D8AcR8wJLcY3F3f32zrn2Wq6VITK4pGrf6HimB03eHu7MOnMPt
 6Zpae1gFPARHDuQolww==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7c0ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: SgTeJ-_-YansALl_qcZIzbnDO7gmyHkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6da217abf689..c68135ee0ffc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1

