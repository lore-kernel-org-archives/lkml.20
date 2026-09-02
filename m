Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606F328267
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321236; cv=none; b=akPdV395SPDoh0Ja1wpdWzSI/LE7m10GXp8B0t/UhJVuevuKjMAxVOgznL+1GPBxjkDl4YsIIwQ3DB0PDOR1CeAzKqXXqxz67XY8sOelIUKSgeraq/epIl8UcEuG2gfypkRrBCMpAxitHQjqQcrGZ6YDNJHRwskEAXqUkRgycTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321236; c=relaxed/simple;
	bh=8OHaoavkJfqqCCpDDJNEQIHd13lV+tTEPVC+AXbCG3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AsRtRxoWjIc1FTpcvKPCqBMg5B6n7lUhoyZoFMrmSwJ77Rj4JKGTC9WDl5ACBbwlaBM9bdfp9Boa+k4HaRubJqYB1re7hcBUFF4iKFcBl9xonLOQw2gHPS3BPwabv3DT5HrcP+cnZeo7ssdFvl99f7hSY1zjbJF3KcJc0NnyWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0ogsTNW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0ogsTNW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1786192a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321235; x=1788926035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zCkQQ3XwE7D3s7Qt8JOH3Nc/gZ6WzlcMVINAa0yLzs=;
        b=X0ogsTNWiN1CoFxDldQUhFPdLlwWvhV24MVCG7rc4sP7CbTHj+RJbG6dMRm+8vUld7
         W73m4BtyvhNX+8fBr+KGlnT6vdCTqKhfEjCFmRFKwxl8xt5Id20wOvcfUUPcyt2SBGKu
         NRD97JGVxddg5K4w+SKtwWeQp+DBQRvg43WdHOLUyDyFMxXhh7SD8Vjt2AcsoKnBqWkt
         ZoQVYjyupLtF0XWH+8/MNAWOYwT3+mYaZgtjLPHy83DEsm6Ylh1/TyMuSvnvJywGgdvJ
         yacLoTSbGpgnQOws+wrW+RnZ6g/AJycnAidwceXE3Q969kKGUarJsISgeqWlkTgaza27
         1JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321235; x=1788926035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zCkQQ3XwE7D3s7Qt8JOH3Nc/gZ6WzlcMVINAa0yLzs=;
        b=GMY1WKjltvKnWBnWbRKvhnWLT3iD4cpZtlcsQdK3qwdZMKV3aYaxD57IJEeT5VdKfS
         F1+xzetra9xVvx/kJe5myOCriNLJFq7Usx2DGAbAPSa1p7q7xohLCHlXi9H1eDdj6HAQ
         HScT4/I3s0Az6aTse0img6R7/vEbmMU6ilnMdraCUKLubcEq/V2Zxi4ZzdDi6rJqX8gx
         Z8x6VCMpWevGv8HyuklVM7J8JjPGF0NmDHasirSdp+2wlYEikPrbfx6pwhOcCvqe+Kvy
         +8m1ypYrypqSERr8shh35bHWI3e3W7viWMWfZs3Vh0EZ4keg1iEo/SMkxEf8Twqadl4p
         Rqqw==
X-Forwarded-Encrypted: i=1; AKwUvBysVki0n5R+ztSprGt44bnBbn5nj84k+USFE7wD9wb2qzkVt493Zx3+ckL+B033V8+09m9kgyMJ6ltpfm4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtIK8N42yZazFqa2QgjEw3vxwv1oW2VUofZ0kPExclDi94xiDp
	f8Ol8OZ+9BB4MlRAaHPKKfQZ12EdQwN1zhiWfE89+PpYpbuoldGnF6EA
X-Gm-Gg: AYBFou28H1atwgQN16Zw/a7jLcZXkg69x2A8SLXwEL5qYD5iutSquyEHAPGpdYzOXL8
	BZX8XhptrqUK6JRYyoiXnXtkZPX9A75hVUFJptSj7b+HVnKi3b94/p+4EgFf+wGdD8++Cl3cTUF
	8SgPBnzozl86tEBb5/CJPo3y0JHqN6604grMFovEPjd4aqrUlbmNjK+gFzaXBdEYS1FQ6bqMkWo
	MG3vJQtUX3qTKlGpZ/VFoo40O+kGrmTnWgeEIL+0+rKlXYfZgI642Sat+cxNAoydNnUSVfJzNkD
	+sNRRjGI27JbzdVaO4MbeKOWsgqTU3wJ7N9qVu1mBv8BXrpBXGJa2y27o3sU9jkLd072ALEIKo1
	5rORxSR9mPlJfZd3JSUej8ddQRcWZZMsASW8aSGtxJn9ohHyuSbwqadjZswF41spYZOV57sqHcw
	BrazOE2Bl6sPEwOUQM3Y6gETP/2p/aV6ousYSbBEXMT43UkPdwUFDo+BYOrK+CeFrc3SwJ8HW6v
	JZRFvQTaLOMRbIoAWcphHx0e8OGBeX8CEIeUlEVBJxTit5aw5hJrjSNaTw58a7Y
X-Received: by 2002:a17:90b:2891:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-39af6480827mr314795a91.17.1788321234802;
        Tue, 01 Sep 2026 20:53:54 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:53:54 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v5 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Wed,  2 Sep 2026 09:22:31 +0530
Message-Id: <20260902035231.81866-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902035231.81866-1-hemendranaik@gmail.com>
References: <20260902035231.81866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index c6373f410d11..e3f643627c05 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

