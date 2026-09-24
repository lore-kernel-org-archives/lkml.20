Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD5249BD92
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261924; cv=none; b=Al+MF94p/apE8jXUNcEHSrqc5p7C2co1w5Fcmv8/Vu89VDXd8OxVDQJNa9sd/QS2bkqUeefFycVf1Hvj/cYcUjEVqu0nXjLK8VRflVy1+fs3RJvssi3nlZ4DIyQXo3ho3bVbF0qqMLQ6FW6R1aZ05smDJqa35Uw3RyNk3qTCiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261924; c=relaxed/simple;
	bh=29OEV1XRj92C0jmL9xqVACrPk1/1JdAX4Z/bbOoFKsc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SscWMcb/y46IQvWOUl5U7PWwK93UINfllOjCC5fOE44tz6FaEwNifXANqwb94vuLjoJhYCrs0I1FlCDZwEvU9Cff01PTntuMZ+tJxPoetryjV4oQEC30qxfFap1vKogqiBVyVOUMfFzjYxp147/Y8mTtWMHHr/8a37LOIpyKpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vxPo8PUQ; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vxPo8PUQ"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4887782ab2dso215127f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261919; x=1790866719; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rK/bC4txKuETskqWy3KUoq+SaTW39LjoZD3qIqTAvo=;
        b=vxPo8PUQo7VLn7zrm+rmJKXVfNvtQd4cpMA99DNWxu75AYSG6US3knq958/x4BYSc9
         6deD50Ro1auFA/VbhrZlonvm9lX3cjXKuiNVSQfV/tCPsf+J0gdx3U74LByoqetk6qDA
         ffdZ1Gag7coX48vYb2ivP6CFPIaijDZj25TY48O1nQHnbGFVnhkhutlNz2XYlyne5Ny9
         OFIkfcdLdDKyEib8xsz/eltA8XXkfVVRvwEcQLLOzP+bDL6FIKrwR/3gYeF2+BWHyq75
         Qoe+rKmy5J7/OPyzfefBso2n1SR2ynbc6jUjqLUm5soP6r/MbN1nHJrFEEEV32+5BBw1
         ne3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261919; x=1790866719;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rK/bC4txKuETskqWy3KUoq+SaTW39LjoZD3qIqTAvo=;
        b=A4s2kNhznAOtf/tVE1g/rqPWoWXRr4Ank13Ln5cUtx5Hojojr+oSEYf23IKWX4jHkl
         Lx3T2PAVLVIeoOgpzmLGpHQSVGg+I7sm1WDEfdcSItg30yLAat7IuE9Fs0vqbaV7RJSi
         4IEjeNm4qFObw6KmEuIyHU59bWZ1GFOS5PBp4r7lw3G+oLK4aq7yKGZ/aQ4DJ3yQCMc0
         qOHNK0GxsXV2vTy8b6m6w2mWbDdzCo0cZjjQuYt/l4gjhvWh8IW7N2dZnYWXrvEDJwN2
         Idg9TGvegDgpbbPZ67y/dDMX9+sC/HN9/m9evAr1SD5Gf4GiKdi4LPZPD4AMhGPzOFWk
         tojg==
X-Forwarded-Encrypted: i=1; AKwUvBzWUfZxnzSihnd/Gmxed0vhE+xejrWeSdVgaLGlqxotG+i0o3U6Ni/UoJc/LASofUTpvrMUtQMsX3ma/q8=@vger.kernel.org
X-Gm-Message-State: AFuF++m0yWGHsBLGMRXVSDHVMDXDfHcStsGHHr0DioF2HU4AwyoFLJP/
	2/vA8u+yCXJHZ3mUH5fxSLyPLgytPkOlJzNFKQpjW87tIc1skEzWoZ39dieya7VpDbYRy9Wiriy
	yGNhvFJRkyIyxefLDoIZxAg==
X-Received: from wrbev3.prod.google.com ([2002:a05:6000:23c3:b0:488:614b:b574])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4108:b0:488:78e4:5e34 with SMTP id ffacd0b85a97d-48878e460c1mr853815f8f.9.1790261919207;
 Thu, 24 Sep 2026 07:58:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:48 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-15-vdonnefort@google.com>
Subject: [PATCH v7 14/20] ring-buffer: Add kerneldoc for ring_buffer_poll_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Document ring_buffer_poll_remote().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index df16e05d7049..5dec079e28f1 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6943,6 +6943,17 @@ int ring_buffer_read_remote_meta_page(struct trace_buffer *buffer, int cpu)
 	return 0;
 }
 
+/**
+ * ring_buffer_poll_remote - poll a remote ring buffer for new data
+ * @buffer: The ring buffer
+ * @cpu: The CPU buffer to poll (or RING_BUFFER_ALL_CPUS)
+ *
+ * This function polls the specified remote CPU buffer (or all of them)
+ * by reading its meta page to update the local reader's view. If new
+ * entries are detected, it triggers wakeups for any waiting readers.
+ * Returns:
+ *  0 on success, or -EINVAL if the CPU is not in the buffer's cpumask.
+ */
 int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-- 
2.56.0.rc1.310.g51773c2048-goog

