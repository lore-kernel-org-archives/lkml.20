Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF94BEE28
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005667; cv=none; b=F9ZgGtsXt1HaoSu6DFAvdTYEy9dE+C+x2Yjx0bueWSFrXrW+rwE4f43NvKfR/aewHdUg5Abo6GTz7ulOgS/9aAUGPS6ozrTRtyjAzJQ+59FSs/BRG4bSbW1aBlVupPl1+/IZtZV2nb90sX6bLeJ/LErPlEcMUGAY+UOTR0tE+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005667; c=relaxed/simple;
	bh=jB9AaIzaqDofWjWx66kbqSGxxZ1cTXYImVWKUZSMTKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NAJfYKBGfYApY7gmVSQz0ImgRFxtbb+JW58jpJNaO3k6wSqI3gIm47QE+BsRFGMqn07ztMSTITEzdsSIaMgLoAeVBif1CTu8tzW8VfCyaegjjMdsmyn5gYaPY07RItcgTg6Kj91Z7fId29FtfgqdDduvmWKHQKoorGmCsQFWRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhoDyNVY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhoDyNVY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so21919545e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790005663; x=1790610463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P2uYJixWWI2wiwMrAZcn5JhkRyy9zmMz6np7e8ozCa4=;
        b=nhoDyNVY1zss9FDrnYIJSdB3z8TJDulqN9GLk7O8+uZSEO2TT5vK4wGNEmxrU/a0pj
         fKWkosJkn6aPWoPpTni2pZFZGpOfy1nW35q2CuqvuzKrU11fOzTnc8s28jsFFaqnZEiN
         Pzq/076uIldXZH6Mq0GojLh4rbhWHGA3q3nBuMjLM6AbaNc3aOFQ9/rNIBAswgUU+DqU
         LiW20vXMs+VGRHkDRJ2vuBE5UVos0ORBTXXDd3U0hpWM0VWdQD9XIpHectkkX/EWm1wA
         UsyViKIeYAPNOz3BdA4LNFmIrjN3MBYs3dEeqBLoVYerhqH8WhF2Yc2Pt07Vt4boDxF8
         GbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005663; x=1790610463;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P2uYJixWWI2wiwMrAZcn5JhkRyy9zmMz6np7e8ozCa4=;
        b=yjjygGd0scXxfqVLvClqHRAVb5JssQumv+51hnFVBTb88ZMODPP/yuUzcmc2y5O9fc
         ImDWtHYMEEuS7S8O4YTNtzHH+P9rgAKdYYMEqQcTNKE4EKF1Gp3Ql3Nkwohv5l/xlqxj
         b/oeIi6Wz00zv0YqZ4d1XKuCftrj1uJqYavvGHt8DmdrwJo9nPxETntWU5DL3sOd76hq
         K0hQQpnOYmdnZQ4nOmlfAxxdskZVKBKTDgyv1oFRO8tM2PRsFXunuvpkLOSF7MCtoQtE
         0X0a8NxUE/6ZXrWT6kW+hX9sVbdLPyPs5Q9BM8TZqXBvFmV1yadL59SPYoqBSG5GjQ+S
         cUtw==
X-Forwarded-Encrypted: i=1; AKwUvBxf2gmDcpZ8UKO9ly9lIlOGmWfju3+TRX0UhsujJpyX45ngxPwLAplsIsm2e2YuUdfme0onyiLLHy8leMU=@vger.kernel.org
X-Gm-Message-State: AFuF++kVI1nW26RlZTnfI57LrdHN57GFFOAwoLJTkKs911hz8EGxpeNL
	bLb2SBfzKUcJnUIkAV0s3gJTfPi2PfEd5xJwXqtS3vXpX8dyZWYrfBko3uu851Bnj24=
X-Gm-Gg: AYBFou2fkoiwyTbDDLM5DgN5XXy8SwFQpDKHZtsInVgNARB2DYP8YQzzbIyrQI5cceL
	dLXNZpDXAa+zPWBZjtShy9/r27VRPrJSmc+PN2P8p5XD+JxzGc2y4obGplPlFP2OOtNdHMA/05H
	KPWraLsT40EVJmSHxDPaYOwdsvVKdTM3STLUtPy39gkjUln+HBXKxkAL34KE//S50lWyNls6FkZ
	HVSSOkY0ttWDmXMroqkuQNfc0IY+7IXs9hcaqvx26oo/Op88lGvhcQV7jGFW3st8x6D2afm+mse
	7ylPPng0g1SfVcEenSbzI3BYt+Bp+suR/mxlXEa2iHMGu/2+Y9lw7ZrqHXq0gAwTFEmw521s/A/
	RNkaKLwg6M5HdYA6rMv/0q1DTHR++PS3JGM1ZWb4tiTpxjvH1QPFXL1nthpd9NlHj4TYY3znMdc
	8C/FhFpqenx7ghsNFS76NP/V9Z2safVQ7GvtOQ1FO0X+B0n7X68zOudDAaRf2glF8kgLQ6N1cc7
	R0=
X-Received: by 2002:a05:600c:c44c:10b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fce72e987mr68826625e9.35.1790005662923;
        Mon, 21 Sep 2026 08:47:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm279287355e9.9.2026.09.21.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:47:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf test: Improve shellcheck source directives
Date: Mon, 21 Sep 2026 16:47:27 +0100
Message-Id: <20260921-james-perf-shellcheck-source-v1-0-adcfc107c997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9RsWoC/yXMQQ6CMBAF0KuQWTsJbYgBr2Jc4PSPLSKQjhgTw
 t2tunybt5EhJxidqo0yXsnSPBW4Q0US++kGTqGYfO2PdecdD/0DxguyskWMo0TInW1es4C1aYO
 2nZPQKJViydD0/vXny9+2XgfI83vSvn8AvReCqYAAAAA=
X-Change-ID: 20260921-james-perf-shellcheck-source-f48df891cd4f
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

I was hacking away when I got blocked by a shellcheck warning about an
unassigned variable, despite that variable being assigned in a sourced
file and having visibly correct source= directive.

Confusingly two things turned out to be relevant to this. One is that -a
doesn't make shellcheck follow "external" paths, which these are treated
as. You need -x for that. Secondly, the source= directives don't cause
it to follow the path either, they just suppress a warning message about
dynamic paths in versions of shellcheck before 0.7.2. This warning can
be silenced with "source=/dev/null" and doesn't require any particular
path to be provided if -x isn't used.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf test: Remove redundant shellcheck source paths
      perf build: Follow sourced files when running shellcheck

 tools/perf/Makefile.perf                                  | 2 +-
 tools/perf/tests/shell/annotate.sh                        | 1 -
 tools/perf/tests/shell/base_probe/test_adding_kernel.sh   | 1 -
 tools/perf/tests/shell/diff.sh                            | 1 -
 tools/perf/tests/shell/inject_aslr.sh                     | 1 -
 tools/perf/tests/shell/jitdump-python.sh                  | 1 -
 tools/perf/tests/shell/list.sh                            | 1 -
 tools/perf/tests/shell/pipe_test.sh                       | 1 -
 tools/perf/tests/shell/probe_vfs_getname.sh               | 2 --
 tools/perf/tests/shell/python-use.sh                      | 1 -
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh     | 2 --
 tools/perf/tests/shell/record+script_probe_vfs_getname.sh | 2 --
 tools/perf/tests/shell/record.sh                          | 2 --
 tools/perf/tests/shell/record_weak_term.sh                | 1 -
 tools/perf/tests/shell/script_dlfilter.sh                 | 1 -
 tools/perf/tests/shell/stat+csv_output.sh                 | 1 -
 tools/perf/tests/shell/stat+json_output.sh                | 1 -
 tools/perf/tests/shell/stat+std_output.sh                 | 1 -
 tools/perf/tests/shell/stat_metrics_values.sh             | 1 -
 tools/perf/tests/shell/test_arm_callgraph_fp.sh           | 1 -
 tools/perf/tests/shell/test_brstack.sh                    | 1 -
 tools/perf/tests/shell/test_data_symbol.sh                | 1 -
 tools/perf/tests/shell/test_intel_pt.sh                   | 1 -
 tools/perf/tests/shell/test_perf_data_converter_json.sh   | 1 -
 tools/perf/tests/shell/test_test_junit_output.sh          | 1 -
 tools/perf/tests/shell/test_uprobe_from_different_cu.sh   | 1 -
 tools/perf/tests/shell/trace+probe_vfs_getname.sh         | 1 -
 tools/perf/tests/shell/trace_btf_enum.sh                  | 1 -
 tools/perf/tests/shell/trace_btf_general.sh               | 1 -
 tools/perf/tests/shell/trace_exit_race.sh                 | 1 -
 tools/perf/tests/shell/trace_record_replay.sh             | 2 --
 tools/perf/tests/shell/trace_summary.sh                   | 1 -
 32 files changed, 1 insertion(+), 37 deletions(-)
---
base-commit: 9453bc6a69ef43755f1c28d5688cacdd69fa16bd
change-id: 20260921-james-perf-shellcheck-source-f48df891cd4f

Best regards,
--  
James Clark <james.clark@linaro.org>

