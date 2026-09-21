Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26967358368
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967252; cv=none; b=kgxGqea3SXWqpKsD0HRJDkN/VS3WTCn1NchHqXkbFW/ngYo3Ml28MLAUaxPakxn7x8hZHVzvRuyUzde/z3c39hjmqnLDpUlO1dCPkyFaY++zOf8KE9EBdlR2AcnMR9qsX/usWDoTCr3hE5tWpfEMHJD3I6v95NbZSe3HzfXF10c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967252; c=relaxed/simple;
	bh=9CG5+TIVVVhdILbf2bNJOX9PamwB0I16qey/intpr9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qi6xbq12aYekQDMXOBN/X/2xMNJU3mPcaxuF2r9LFzXVnU/8KR8kTP99YHdK5t9k2w9A4T4JH7D8kuTWJWLvNz+MPV1w9hCIHQs+6WioY+BRpeoJKuCHvoqMRyHiKsShbCZB9Xr1giwiD1OESM2tfP9QoYcGZD88/yFa+pBDPVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xp+ehLiw; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xp+ehLiw"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3489081a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789967249; x=1790572049; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXQ1t7M/ttKG1gpCPiapMoUFSHKPI4WUjvFCcDFwkq8=;
        b=Xp+ehLiwzScPa8GKyn6kVsZc6Lijw4hb5PioDrVaspph1rcew0/5VMdEHPa/VWnZkQ
         tydcRWxZROAAwOHLra0nckFKpsQ252EtIGCdTSBb8184YoNt3Cq8PetaSDH4MsKyMD0v
         5qaZuSFSGtVpWGmHQB04+wOu8SvLlvYa1csyLsTAsnAqGgSWJWJXZyAZX+L79Y+0AQzi
         zK/QyiioeCOTMeu7TKTMaBaRNAi6vMZaf6rdixb+NC0csmr4Xxztwfuc5BBv/BAm8AuX
         Gzkts++mAmlPeGyyjV+ncJs2iWpqbKuNU+01Ax0NdKnezFStvkkk+XUQyn3koCGOBFmY
         nOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967249; x=1790572049;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXQ1t7M/ttKG1gpCPiapMoUFSHKPI4WUjvFCcDFwkq8=;
        b=I544F0rmxjSEr8p9MIQCyYI0BGBdpWuF4VrqTK1nPdih3TfX749DS93wzvHG9Oruqi
         4kM6IB7BLPc588ywY0TW4jrB3gXEuSA48nRquvYmtrwawU24jPTmDOQT8ueuDOx9BW3F
         fUtXuAEXUkN0F8LDrdaO/33mkJZQDFyZBfDcF8fR840SvLru4AslP9AoSyUeTgXu+v52
         ilN9DLET1fNg4o5FeMX/RtQvKxwL80Oeu7IFehPqptji3E6c4TCoW8jlyW0t8kB6su01
         tyJ/PVTlrU8CZH+DWp8GlSxV2B17X5kT7+mgldPVQH8FAzrCwSKxi1G5oy/JbcPrNCze
         QXAw==
X-Forwarded-Encrypted: i=1; AKwUvBwIInbiYO3S+dvXEAuykEGoxPfF30CHKn0FXPjlJI3Yc1juFS/tFUsyCD3NJhaFtS42M4ymGoRbW0XBz40=@vger.kernel.org
X-Gm-Message-State: AFuF++l6edQSr9eRxi1IQVWzhcbwWlTV2frytoABAi1DoyXVMO7TbTXH
	NHULpgBNEKUVHymMkRCFnmhaGqYkWp+TGj7e8lalaWUezfs0aP+HFotHyyORpwiAS3FBBNwA7Gk
	6Wxfq2IPIFA==
X-Received: from dlbou20.prod.google.com ([2002:a05:7022:1114:b0:144:d82d:aebb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a08:b0:3dd:a006:5598
 with SMTP id adf61e73a8af0-3dda00655e9mr8559353637.38.1789967249392; Sun, 20
 Sep 2026 22:07:29 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:06:23 -0700
In-Reply-To: <cover.1789966896.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <503b656ff0cef2a2d6126b74e7cb4f3c2c7f823f.1789966896.git.irogers@google.com>
Subject: [PATCH v2 05/49] perf python: Clean up pylint warnings in tracepoint.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in tracepoint.py so that it passes pylint
without warning suppression comments:
- Catch ImportError instead of bare 'except:' (W0702: bare-except) when
  importing setproctitle.
- Remove unnecessary trailing semicolon (W0301: unnecessary-semicolon)
  after evlist.enable().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/tracepoint.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index 15b0c8268996..9d49a25b3b1e 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -9,7 +9,7 @@ def change_proctitle():
     try:
         import setproctitle
         setproctitle.setproctitle("tracepoint.py")
-    except:
+    except ImportError:
         print("Install the setproctitle python package to help with top and friends")
 
 def main():
@@ -29,7 +29,7 @@ def main():
 
     evlist.open()
     evlist.mmap()
-    evlist.enable();
+    evlist.enable()
 
     while True:
         evlist.poll(timeout = -1)
-- 
2.55.0.1082.g2b9226bbc0-goog

