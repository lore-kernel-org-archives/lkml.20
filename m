Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4A443C0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124231; cv=none; b=VYuRmxjg6M/caPquUQ0TxN1jVlGikOik90rV9+fUQfbMcwBAEGVIZqqVBYpfwmt8W+npLBPwO+lgLZ7enrRvWiBZXTSPAoJ3CAmcj8pxNXwjDLEOk6Ew6Z1U5JH23lUHQUORifv4onKi+OpeA+yyevXxsCvqOGO7h44pnmL1H+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124231; c=relaxed/simple;
	bh=CNk5Zt63QFGf1xTboVD/YEzHzmeTbVLuxljGB3UGrx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l347f299e+1TlQcLNff+r4kwl8oBLSQmpVCe5T7LhJa3KPVu+vVUf1YcaB/2n5BP28GMdNkWy93RBJoF0fYlvOaZtHXL5C8wPM4vT8xqZVC2aw/VgZv4xDUVGYqbEP6VjrWm5JJOkVrLfCRLrBhqoiBHta2Tvq8Qie8jOvUU+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0qugSNv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0qugSNv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499de29beb7so412695e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789124228; x=1789729028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNk5Zt63QFGf1xTboVD/YEzHzmeTbVLuxljGB3UGrx8=;
        b=X0qugSNvi+Q54/y3C5ot11yt84LgDsrQsF/wOg4+7AGCwUR6t+3+VCfCzK/NDvEw4r
         5Tubctgf65DcbbDBGFUsFMNuQNYwuLhF0fdmL+XThvW2TpQI2zsaXuj9DO5tH0R8F+J1
         V1VarETlz/q1xvx+yq18UwyiDTLxM42qdWmoggpEntlMzTbXEMIQ7OVX59zExy9fI6j9
         Nvyuta7MBGdnp7E5jCbjm23HhUmTaP9I1LMSyv+Q8Qq1H8tQy7zF12oNW28cDgUe0gXD
         o7+MrRrzQ/zKaWPDR3NKUOmooycGAaTgJmOnPyJ+5IpYeKV+cD1IumJLR6fDPWX2rP9b
         OYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124228; x=1789729028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNk5Zt63QFGf1xTboVD/YEzHzmeTbVLuxljGB3UGrx8=;
        b=df7S9A3YKUokoAzp2BvFS0fbUYsNnFFQkTQTXUEZwNtSroavY+gKagpPlY9hy/zBOR
         nCP5igsaroO4Nwuqviyk8zOlDV1diRLXv+gdGpvAitS7uLZv5sao+ip+1834/fIYU+bB
         slPPpiHbY8IKVKujzJpMYzNq9tzF4ibTOJnGOdAHA1tqK1Fm53Sroye/uIkqHhkRiu1F
         HpvhBuHcILy2TVlUke4DmTfLAJ4J25iyXuvNOA/dxBAUi8mdw+aPpm6MVftAXtq9vnbt
         tvf7a18e5HqKdle1ZYOLGoU4vk3W+rKxOeE6gijxCtAM9m51rq89i789Zx38DUM6yKUR
         Rt7A==
X-Forwarded-Encrypted: i=1; AKwUvBxaFZao3OHMNlJ4Hqr6lcHR6hQncYy9r38PewVCz1QoxeTDsuzKGGND3ia7LztkxVHEErolxbXfPTHw1ww=@vger.kernel.org
X-Gm-Message-State: AFuF++mC9nM/A/9GmiVmzltEoFo3Kj5mqFmUMEzFFj3Pftn+CA0C+6iL
	UDH7CeW5HuPvxUNY4W5bTiNyzbogHeN+KQp+5MI6NjDMlXLwcaFzCCbN
X-Gm-Gg: AYBFou0HJfgbhqw12ZiueHRim9incrsttcMFUMdhx04gavMhkL0nChbOqnylCQUcxH0
	JMJiBqUdwJ8sWw+UHh58T7mwyPc7I5HGwuP7IpoF6XXBF1QN5lEn1d8+8kwi+OoHNcXRkAfeNox
	I3Gug6pAIArjQVoW/Av2DhyTkd8AoVRrDChK54/WE60wBq5lSmpDMf+qcWMtd2zLHaPxuCo6U2y
	sjbgLAmk1t/6fcfyYkNm7t2NCSlsgSbqFsz1i5uTC8Uie5CVugYqSu5CLPFdE2VmuVsv2KVA3Zy
	QAOaTnrpx5NyWFp+p71zIXkO2TFqWe6vp483w6QQxMeC5XbF5Lz0sAPfn0uKk2iKJitGN92kg7H
	JUUaU+QZ1OD/4E6VbavwrIQsKbrr/wqjNEQQRpr9qdM6ygI36Y8FmtADQZ1xmUvmHXraS+23Qgb
	W75PNHA+lUj5y7U8wboo56YVlkvHAMTsEHdiXUlOn/kUcMYx5a/Osp9gvWZb0JfhAmdD4JLc+8n
	HWrDVQWs67fVJNXQ/+A7w==
X-Received: by 2002:a05:600c:4688:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49e619ec129mr39509475e9.2.1789124227890;
        Fri, 11 Sep 2026 03:57:07 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm39874535e9.1.2026.09.11.03.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:57:07 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 2/2] sched/fair: avoid recalculating curr status in place_entity() and requeue_delayed_entity()
Date: Fri, 11 Sep 2026 13:57:04 +0300
Message-ID: <20260911105704.1220164-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>
References: <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping on this patch, :_:


