Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B83B3898
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968277; cv=none; b=IcJvL8RnrGj9b3n3e0Xrm/G/r5Tn2VEjfX4Ns+yZ+ygIrVLoxiMbHXXoBWUwKHY39iOJZVeYQ99TsooEC3C7wl/OE6AYA2jgYQBEtJgQPCSdhfN5uFLF9LxMl0Kvw0G6qsKNEnAD4eHIe1LLmuEBUQGJiMcSOEzslxcZl8KKZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968277; c=relaxed/simple;
	bh=vUNlVf7JESsv6d6O+/J73fzOkNK0chAaUef2GsfGc20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g0NKuJz2dhzA64K/nDoP4dUhScG6C8Lsh8mIaYITA5hKVY0Npw8BxVONvqn0e1bAHN/6FRWMRhJP1gpuSvIZk96xElrm+nljKJ1YQGFI2UfVtAJbMn7F71Ueqpo7DB3THNci5GcRJGHy1lfk5ToVPgh/ni2nn6CLgExujk2SXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqWckFmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFnJA8Oh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqWckFmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFnJA8Oh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H60VQ1278018
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCfqsaz7dzpRPunjkmDe3O
	ygx34GPQDXl5M7ZEAewsA=; b=ZqWckFmvNfcgHrh8nD3OpE+mpSmfm9BX2IeoH9
	4vQBBiU5JGSCUCiEMZmPyhw2rZgNQBwWNp1+U+31nri1FKYtsTG/dgUc+j+MPNdb
	vHGjK/vCvuGFcD01ofi1sj4WDeYuexsLuFA1ErScBO5ZXYGYGbsfGZWH4d5RP1Ea
	f5kjfEqTewY6HlpUOdgBD6yKw4GekZpwlOwBZgJNuFHcRBjkUPD2gJ5nHGacuIpP
	b273jTDRoCXyP0nUiAHYQF7Bp3KZC44YtwxrDxsQRIjjEXD1/K+tBUDk00wuLIGC
	sIFY9Ys3YIzDxPAE5HYpsjG1BbZzf6CD1tfgQU3NJZB6kMnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdhb3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:11:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so12579674eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790968270; x=1791573070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCfqsaz7dzpRPunjkmDe3Oygx34GPQDXl5M7ZEAewsA=;
        b=VFnJA8OhSbDUoUEjdQ9FpHurTXnaWy8qJnPm9KfeIJcwrTG2+1g5k2d8Y4d5TIcIGy
         3Yn5jkzqLrHOaAgl43BCOhxLwaHGpQmQrYgJ54qdybpEH57Zc3WhsHEtTcyQKCFZqKet
         WcGkOoJUWvKltuutB2x+aaJWiFi8r3KnMOr8vy6ouY17d+bF5cTiyyXrMMys2ECX4YJp
         hxfFkugtqk5KGuGD0/BVFREodEjtk5sP+Ayja0L3v/p2e3VchgRDpK60/EhKPm7zLT9a
         47WwApF0/VMgJGhjhivKFpfbEV1+FkXFaDSWtoeToUzf73Gm4owTClnbumlB60CkeyBC
         /vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968270; x=1791573070;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCfqsaz7dzpRPunjkmDe3Oygx34GPQDXl5M7ZEAewsA=;
        b=Wg1ewth3JEunhhnacZ7rkZTkHms4qaEAgEwR3pJNJo6/uFHnHUXOy+i3qOF1nZARSa
         CMkK2dcuzmpOsZAePRMV5d4AYcXbFVqzZXHaLtOhVo3DN1W3qZ3FR9ZM+sOqM6cUXHzg
         fBkKZGk0+PzBj9G0DEc20LhjSRHokETj9eF9Ir/tqTQfJTCKs1TUYYAyMikQwN+XcFZR
         sB0r3v4BMkb1Ic0UIVmRbUvwjSeKWZWzuGyBobzuAF/O7t/X7bSHQDbYRYfeFJOZ8+kz
         zyu14ZzteJgwfFWzxN8fX9lIV/RpXS03WG2K2biz+9uXDMuSSXUj+z3FuFmTHZZRwZvw
         o2mw==
X-Forwarded-Encrypted: i=1; AKwUvBxcOzviFzDGs8Utjki0X94WrDTVaaDT1eWxf4Sm1wrSlDEAwjGsRfPY7bY75pRUbwKPhUQDJOXkTx4zP2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkG+dfs1u29LYdy+YgykoNzc+lV53J9pmq/0QZQ+xy7nW6B1r/
	KKRnrMf1bY7CBLwIJEa2bkltLK7IG33foPnZDZXnclvoRDzmoxH4IQZYbU1iopstbvgwrTedlkR
	cX0iW4AVIsmW7uTzVAemnbGA6Tu1qUxWgsDVqJAbb1KUV/goklbzh+bT3HN7oAHoiqQw=
X-Gm-Gg: AYBFou2PMIE4RrnjSNBaD8Cm5jpefX/gVZsTXs+mGUNX6ilWrbSRNLB6XK7DSdFWqkH
	aSZvpyunVNH70dc4lvuY6ZqEU2fUyzIfB2XWWbTdkCzjWADPDd9EfONI6L8AO039i+ac2R8TXq8
	pNrImwmm/bWyP7Lci9r28UB1EnBSZYlAxZ2ceqBtnobXzBRclDWAZo0b3w/sPrAVF8gqkoIaZ+z
	lOIC7UkIJacl9c3dfzYzSZeuV4nwaZnYVoXvMP9spNYDmeXIPCNpbeQCQe7YK/zFR8Sj/hkC9yo
	l3PT4LCocaK4lg84TluVKsAn9WyJak4sHKwWC9yP5y+1Cy9Zz1yf7uwf0MceQDqO7dRVc5LsiXS
	alRVwHnkHVXPdAUaPQpDWSVIKxkNyOIAe/+wHnWrx0aOTmT5Cy272RMU=
X-Received: by 2002:a05:693c:41d0:10b0:34c:5de7:6a96 with SMTP id 5a478bee46e88-34f21994aa6mr3924774eec.35.1790968270151;
        Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
X-Received: by 2002:a05:693c:41d0:10b0:34c:5de7:6a96 with SMTP id 5a478bee46e88-34f21994aa6mr3924742eec.35.1790968269428;
        Fri, 02 Oct 2026 12:11:09 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm5263296eec.8.2026.10.02.12.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:11:08 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH wireless-next 0/2] wifi: mac80211: fix CSA/CCA regression
Date: Fri, 02 Oct 2026 12:10:55 -0700
Message-Id: <20261002-csa_cca_fix-v1-0-b83a998aeb44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8BwGoC/yWM0QqCQBBFf0XmuYV1Fwz8lQjZxmuOyBY7WoL47
 031eM7lnp0URaDUVjsVvETlkQ3qU0U8pnyHk96Ygg9N7X1wrKljTt0gmwPHGPuzeXiyx7PA9K9
 2obcUzFB1GdtC1/+s620CL98iHccHkhLJZn4AAAA=
X-Change-ID: 20261002-csa_cca_fix-ec333d7100e0
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX8Y45BgV9OiJb
 XhUSg1ZA0srJdVBLHWvm8+3k6h4DLcUsE9ylxpW8gysCtzfHQX/mXLGNHgMbimhgajAXsYQwWKP
 1rAScVo42/KnTrAQDSojA/5yxY4n3TY=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac001ce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0AfnAU6H5NbzKUBkI2AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: FzFXRNFDIesDPSFpbFku85wl-5GWJ-Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX9cOYpuU9De58
 SI0+EOYagBxFFEnAWUaGWHaAAmiU9dlI7KSKoLJKJELZVeqMUZ7kujXz4nI7Vg0k5qPxH9kQXer
 lfgzGQ0gZ/LcWo7vem/INI39WjcYTNBeU5ob9XfZ76oq3IFFo8Gmh0+9H4roYthKdAcJS4FXlNJ
 1OPfqMWB4d4HST+bps+TcQ3hc2PAVr3UK1q+MGsAWk4pWSgQmrYXSZ9ZtnMjCc5KLj43HGjefzW
 7iAFrCTpThJz3ubGGJSa4GkIlWkZ0Gglp1yyyFfsEIl6NAl1iKN2GbeWvnb9oQ35g8oDHOYYslA
 kwHCIdmQhxs9JMTwUkR4iplQLcwxzvA+w48ZekVLCoW4yFmtFTTRFynvhaQ1wTcivrhISRIndVa
 FTetF8cexzL+DQwMv5cWKsFLJDURKFobvg7g6r3k+yqBtCLQMM0MWhTZN3xXNOffWZvTupvHmci
 kXrS++4q2xs0erbqZiw==
X-Proofpoint-GUID: FzFXRNFDIesDPSFpbFku85wl-5GWJ-Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076

First patch reverts an old commit with detailed description.
Second patch removes a minor redundant check.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
Aloka Dixit (2):
      Revert "wifi: mac80211: do not use old MBSSID elements"
      wifi: mac80211: remove redundant null check in ieee80211_assign_beacon()

 net/mac80211/cfg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: f49defea7668d8c68ec19fa085ef3da6075561c7
change-id: 20261002-csa_cca_fix-ec333d7100e0

Best regards,
--  
Aloka Dixit <aloka.dixit@oss.qualcomm.com>

