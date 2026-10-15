Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BC5349CD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075615; cv=none; b=XEXsh4zFra53G5/dgrLrEOB3cBc18Yssf0EoZF37kFdX2hzfSD1csmnxtjKfo/XLGvwrIPRbMxGBlTywCzojVTiOBKU45NY6RYijiWpGAfWPRZ0v9OyHAaonIEwhcVBVLjvBlHRc27Vs3yRdQhOlfzrBMprS+TIB8GSn03D4ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075615; c=relaxed/simple;
	bh=b5psEhGu33J6XAeJBkiV8PWWEXQuiHu7lH/f7ufztzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMohAU87JthB3yN1GAZFhenxdSqcTk10C8j5ipgivhYMrkntH4/9ZovDIK6oj8BTmBrBu972GADgIFUpLSZg1FDciMCo1hFvI9LgcxayhCeS36iT9kvNHZXVrRKVd51LXYTL9vet3Lxz1GKqI4NNvNG5tK+x7kJa0zAOnUQPDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pj2pRZXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKlsCnH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pj2pRZXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKlsCnH6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jsSX2417395
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=; b=Pj2pRZXhZDHAO6o2
	1L0M/W8QrYfyPW/n8w/EwEIrtBLG5biGjdFyOSRjGVKzAQLzU+F/AjpU7syRPgP1
	aAHX8ynWAVeDtyyaV3Aab4KcrYC00QC+e4x2Jhl0uE1X2K8KFEM5coSJn+vzaLKb
	8aYBGUEW706t6LjZM/A8CZITR+le8OXM9a0HRtbm1n1mOzfHX2BTiVds+txQVcVJ
	W8+Ajh5uA1RAIBdxmstYNh63jbCIfH7TX3Um0hxjFv5KKD/ZmukIpQdkIrlVdQm+
	eyAwD/grVieLjnhedaYd0Or4Pe5hR5Wm71R5AomlTlE0TBLvrIjvAMghYRmXH26t
	xCTzow==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjn9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ea8f13da94so167212e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075611; x=1792680411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=gKlsCnH67mO8EobpLm/T7X6XCoKPrvAx1VAi3s2Ime3OHjHMNQxjFv9frKzKUWM3so
         zwuJC1e+IMix9OrCoiYyM63/cScURv77UAR7eqejCmJxP/SlLqjE5d+yFkskZfh+OXKo
         ZOd+R0E3XwJhSYNY1aa4LpKt9dL1PgCt+Ux/K8wCf2F6vuWsbnFVlP0TSF3LVJoPm8Ip
         bATlbEVXxtmHXTzE7evzcVnzWgK8l2bi6+moDg+G07yR8uqS8gqpE56zReDaqMogspem
         Wu7/qUAjJdpY1Vw0y05PE0wJm53GLsVm7/vgXNgzuAjkR9hQHwNo7g6lbw+DkJLwlsBB
         8woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075611; x=1792680411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=GIn2jpU8rz6A7iHgR3IHnVwYlW+sQbfz0PxyBKLZqbglvk1krF/baQWXSj0Q7PTqMA
         dFbXlL/ILhTUocH+uTviFe4gTynRK5I1Ymy8zoBYQ2QWKr1s/9UvltGjTj88aa8aSK/6
         Cs2XZQ5c1UgcwIBgx6JijgfZp3D3RVS/wcfO1ojJOfIh1LZN/bmwKd4hwl2MdJz6pSP0
         pl+iUxoi0Ais2snn4cSpzvLLCLzIrywSzqjssFuJtujOt5G3iL07B7J2HneZpr/ItQMb
         kJJMiO80FtdJx+NekDBo6l9s4BePbDlneVRkjRxK5d8gAt95kdZCPH86LjAOOgotvivB
         J4cg==
X-Forwarded-Encrypted: i=1; AKwUvBxDscLN9sRCMKJ171NZp4KVah+c5Ogy6V7H6rzEpR/ibGmItj/40JOMnubpvRgoAsS8UTx90zn8w/iQVRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfRmnCKNqc0YO5acP3xLmxeP0aDEL3IYysHYzt2ALPoPlP3CrY
	KObVr+VQECjR0JwSod1JUXsVqhxM2gq1tf/8LZbilFyZUONqC6bp/KPa8Btjx/duZw3ny675bqN
	XxGQY7ipfs2rIJK5q4XCk2HkQ9g8dyVP6ykS1fUL1nVB+WPM+uzjKaLrl/lSTDOsOtz0=
X-Gm-Gg: AYBFou3Dypr5LhYIbeRvbeQiewA1AAyUzT+xQNrDHw74bbooA8dxVYQiF4JLWwQzDzO
	TuvLoUoS1aN+DitxQNxAL4avSIWuvWVJ8k2Qup+ym45vcSXIQqyci4EmPSUH/NboWbo3Hn92Ems
	S2pE0PkTmwznslJoQ9KV3b4tNVyp4zeIN3/7wnWz1tTIe5uBBV/3F1qL3drXs71w+5vx1UrcFF0
	HBCPWsXsfI0VGyBGeKuEF9Hh18qpj692lOb131ITfUlSDULuyhsv3248Z2oA1gqk5nOE9TSJb46
	uWrUr331OZaVmh3DSo7ipTNkMJjolJ3LNkkZ0k/Fpck7tV/RClQpgcamHMfzyv/5M7kBWqaoEN4
	aDP9XKJ0DHie3asPKS0RAIfPH4LhE
X-Received: by 2002:a05:6122:32c4:b0:5e9:7458:9bb2 with SMTP id 71dfb90a1353d-5e97458aed4mr1657872e0c.5.1792075611153;
        Thu, 15 Oct 2026 07:46:51 -0700 (PDT)
X-Received: by 2002:a05:6122:32c4:b0:5e9:7458:9bb2 with SMTP id 71dfb90a1353d-5e97458aed4mr1657805e0c.5.1792075610187;
        Thu, 15 Oct 2026 07:46:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm86840625e9.10.2026.10.15.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:46:24 +0200
Subject: [PATCH 3/3] software node: fix unbalanced reference counting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-swnode-dev-notify-balance-v1-3-9e7537bd2869@oss.qualcomm.com>
References: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
In-Reply-To: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=b5psEhGu33J6XAeJBkiV8PWWEXQuiHu7lH/f7ufztzM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0OdQPjTd4GxgYuJMtA5lOtb09Ol7UVKoKR4x/
 2YVbc0FKBCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatDnUAAKCRAFnS7L/zaE
 w6VxD/9BJiZbpWvTi5865mCNX2ReKRoFB0ADV5QZrYpCJpT5UiUolC9ZnSkJXQ5Jx1SkWXjkQYc
 TJdmeHFxa14DI5LD5CeVMLKuRayuepHi63Yv1/x4AGmKMWGLXiLW3sSjKnHzGy1Npk05hR7UXeD
 uA9ymDAhDBqtEr5pylUu6zgX4xcvcjL60pJ6MGulg/9OCGEoLFS2b8OqfaStyuV2CHDM4OMogUU
 /+a3wCpU6p2D2AflwMBlwWSBJxRs+0o5vBhlPoPomvoY3zzZFo6CQN50DI3uuthPJInedp6ur/9
 5/NmlvCDKpfjyRfb+m0wFcDVle25Dtj+PAg/aYYjGrAAtFS+CdETUQYwybTHLHlMahIohyQ3bsL
 d5SFkTxBsWDwR0iXwE4PqoNdx9A+N/2OCTU6KD+ewUMDj6J+PMJhClEeQlKwDR9DzQEbl42Qend
 0p5pa96qL/lCSttyucBVHmtc06pFpCfGmrm0sA9A4ikWWgQhHkzkCGLfDHhKIexD8gIiikkW9QB
 JHoFqHwyZeCau5ca8i1THq0mKhuXmZDbNJC7y4+L2EmJHyG1MJlmePkNEFf6SqASoLutPA5JcFb
 wJtVAHMUhtngb0fE2YbyQHukrq5C2/u5Q15c04p+ZMzX54k1H01S+8wyuudbreP1ZaHebLdKnME
 o3hg5gIDuarpSfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX0ShVbaehbDDr
 pTe1/5m5v+mEqHEeCNN3CvvwtX9EQdPWrPKvLrcl+Mm4SaOpw2Zzl96n+uvuDUI9vmV9vu7wp/a
 NFOMJ8LMQCfwuiFitmlakL5XG+7CDZs7q9XAFeDH4jI+hXKiJ3S4lWhmv2I88BHsXtWgUc8b5B5
 GS57k3l3IpaMS8RA7juhdDYB+mqzQE6YvKJwWAFd0QJ9Z2SevtwdzFB9zzAnIOm01OflS314dao
 CTkDIg5KJcoJBsHb7hrWGejojAPrxazcYSopvkOBDqSH60Dlxz7s9Q9e+M7pnToU8LEKrjQ49Jo
 H58VKQ6s+7BA218+V3uF4BFUf2o8XeD7R8OwBUSbcl0r7PBOrU7gw/S4KUlNAEue0UVdaTS4Oa0
 uXGnabHk+PQtBKxuGp2BxVJnRBv5tmqpBnJFWxKiOYS2/QFyu5scuIcUVDX4q1P/9IfLlQ41xDs
 0AbAsnyDhx+ivVG1BlQ==
X-Proofpoint-GUID: OVT4GqVJdKtCFTYTFeEv41UDqLfjb_rn
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e75c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsDmPXzSDgUE5-xNsXYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXwl//PMbWdbDg
 LLcMTyOumOptE1vyXyy56ZPcc6SnBaCbtXFeq2JjrI0nGlwJBqNXzTIYdMBXgTELQyoUXUr0nzl
 VUM5jkRXlUL/eDAZDIs96VnsiVLO4TM=
X-Proofpoint-ORIG-GUID: OVT4GqVJdKtCFTYTFeEv41UDqLfjb_rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

software_node_notify() takes a reference to the device's software node.
software_node_notify_remove() drops it unconditionally. A software node
attached with set_secondary_fwnode() after the device was registered
never gets it reference count increased but it gets decreased in
software_node_notify_remove() all the same causing an underflow and a
use-after-free. Use the new device flag to mark a device that needs the
reference to its software node decreased on device_del() and do it
conditionally in software_node_notify_remove().

Cc: stable@vger.kernel.org
Fixes: 384f5a857bae ("software nodes: Split software_node_notify()")
Reported-by: Eduardo Ruiz Duarte <toorandom@gmail.com>
Closes: https://lore.kernel.org/all/20261011131518.48838-1-toorandom@gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4bbcca62bbe67c3390693500b01ea..9207d7f96f20f8cfaff2a4eb8915609c499cce24 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1176,6 +1176,8 @@ void software_node_notify(struct device *dev)
 		swnode->fwnode.dev = dev;
 
 	swnode_get(swnode);
+	dev_set_swnode_notified(dev);
+
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
 		return;
@@ -1206,7 +1208,8 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
 		swnode->fwnode.dev = NULL;
 
-	swnode_put(swnode);
+	if (dev_test_and_clear_swnode_notified(dev))
+		swnode_put(swnode);
 
 	if (swnode->managed) {
 		set_secondary_fwnode(dev, NULL);

-- 
2.47.3

