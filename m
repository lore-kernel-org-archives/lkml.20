Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D0541E72
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077795; cv=none; b=JOwdmlXKZrq+Sq6dEWMCMGjEeOvNd9ZGspmZE/nFl8NyFlolk5up/2V8cxsuWoIhfzNethhymJKaPVHmTh2jkhsSW4bfsxeqOV1Fv/MxWdk2NEOXAhtxBgZdjWr6XnAdSfxihXmntdvjhdP+qq9HlKFRP1GJJMnSLtbhhyYgXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077795; c=relaxed/simple;
	bh=4dauBJvADEExgMQfHXq+IRvV55pQwyhrlwye1iITDI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLmaYMX1pqwpN2hiogXjSBFDXoEmsf2lPoJwXh2I2O+MsnyMyUOaIgrvDIGf5nU5XDhuEI99BOIZTNKUk24I8mC1fKzsMsGWOYUrXg8n9wY8wiDK3tt3L1Vjkoi6ZS/USbuQeldMtbZYoNvRV9zzzygxVbMzKDf/TX6hwfWlClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2kl8slx; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2kl8slx"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8a83d2706fdso22193177b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077786; x=1792682586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffUdm1w2bLO+0OCh3PoxdUD/MaQBekn/KGeOVmB9bPs=;
        b=P2kl8slxMqYdvWUGAqupDV/AGCjUpYuzZKb1JeqdzsWkk4ePfKV5x9CUYQOyLSRd3A
         EfkFRtm8MAks+l4MpMYjENvTFXdRwnV5s/y+P4cRfsrYY+olT1Ra0idXwC75wKQNz9So
         FHnSS0um69oQPgm1VqSr5A5/Dgc9INpIHAQ4JWtP7Gi27Xl1MHFl9KZt2L1e+p4L0LK2
         uaeQi06xoO9ouyJUWqkCvrHsxGYSTNLGMXZg+EjvwRG2HPb4h+lq9GB8zFiNvGteduLi
         iMF/Z84dP6++DeVbDpC3fdk0Q+j6Ncqj9uaVZWL0mqBmKWk4lotx9wvb5l3b8k/0+tPW
         2XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077786; x=1792682586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffUdm1w2bLO+0OCh3PoxdUD/MaQBekn/KGeOVmB9bPs=;
        b=ZZAkn99d6FytdLGkFnwbfHcCUsuxo+P/RzWAePpPF3S3i7cNVoh61rj+fFdIPjoroa
         SgiK4ZO/8J79vb7+MDu+VJV/lqNL5Bi1HFg/objUQNPXfK71Oew50K3bPgFCis9e1u2a
         LYqslLUsfKcuchMOhDajhVzNNZoA5/zdhZ0mtfxAlayQss0wAzx7gWt3dnvRjzn8qISq
         5cxEldt5WrPc47MNuMCFGClm6U7uyj2v6Z/D818ZxTZE5UgtfO0VRD3/IYHSYrJBLvcO
         t1vbB4VOnhr0jBCoW1ftvL7Q+dgaOWEiOZYgydUEudjp/K0HsWamV0M4DNVYsi9LOMrG
         6FwA==
X-Forwarded-Encrypted: i=1; AKwUvBzb5rtqKSVsbPdo54SHBrVsAWRryLtXKdpzfHa/rr6LIFsGeKztNYfq9lR8vgFQdejA2rCyQ1F59VNq3Rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTpsRtB3s+1VDhhMls3JxRAca3grp0S5uP+k+5mKaNj93tLLQ8
	UdPqTDkSd7dZdOMHwzp6jhdIAkiS/vU7d+loRp+Zt5cT5r/e2l4Dru1rwyf67w==
X-Gm-Gg: AYBFou00tw/2KC3qFRByKv7oAhR+dNQ+01PM6Qjn635vEuZFDX8xjMOwLwrLFiXsB+z
	vRSriI3+SgKFP2aso0dOoS8Xj5lNYl8xrQg2B/ijDfHeLvtm6VDEU0zNoNUWvMdljCcW4GCaSmw
	QqokKd8mRts58Ml8pl9aybuBPl9cP5+LLH+Hf9PeIXeQWYrGi6Kd3oc4Mam+oJlhKO8SG0RuUuF
	iVSNNXkqveUWazAHcLwxFdfCBolwxQWoD6QZ6hOHiV1MsmGW1jvlRygc9rWcg8SUjKMjW4SJK7d
	fKSDzt4YeCGR1fNfFK4oiyQXtuDjnNnrWUhLp2eSBeqR1K/JRZ001+/CQczDImd1gSLo9V20jaP
	v4YGMAnWYwgbWuhsrpEK/3BACTrSnMRmPIwEGeQ0UthXfd6CpyjpObFw088HRVZBJfKpsVk37tT
	rBVIbP627SJYMXXNDXSTBIpepWl3E7AOspuJfjFQjEeINSJSVN3bKGvKVvYmuCdzt2xRI62PhVm
	17G1VoIq/Ih8U2j/tvJvYpsGR1ftgHEImzp5EvuQM1DRqavss/lWJ+QNXFw6jruxO3410U=
X-Received: by 2002:a05:690c:c4e9:b0:8b0:9eb3:dbd1 with SMTP id 00721157ae682-8b09eb3dc7dmr36797807b3.37.1792077786332;
        Thu, 15 Oct 2026 08:23:06 -0700 (PDT)
Received: from tux ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f2320a6sm67686617b3.35.2026.10.15.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:22:38 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] wifi: cfg80211: Fix error pointer dereference in nl80211_pre_doit()
Date: Thu, 15 Oct 2026 10:22:08 -0500
Message-ID: <20261015152208.351083-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl80211_lock_and_recheck() can return an ERR_PTR on failure. If this
happens, 'wdev' holds an error pointer that bypasses the non-NULL
check at 'out' and gets passed into wdev_put(), resulting in a
dereference. Clear 'wdev' to NULL before jumping to 'out' to prevent
this.

Fixes: 8e3d9039d280 ("wifi: nl80211: avoid rtnl for commands that don't want it")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 net/wireless/nl80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204aee3..7a5f7000fbaa 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -20192,6 +20192,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
 			wdev = nl80211_lock_and_recheck(rdev, netns, wdev_id);
 			if (IS_ERR(wdev)) {
 				err = PTR_ERR(wdev);
+				wdev = NULL;
 				goto out;
 			}
 		}
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

