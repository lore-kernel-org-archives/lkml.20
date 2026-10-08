Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6734DA9C8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471882; cv=none; b=XlDpfNPy+lDMO9H/8tpu9Nmcaop4qq3MiowFW5bEBtkwoD+ri2zurZyQw5djlxOCO9POsO/asXWjuRwp598U8s+tC4H0iT7XrbMfFbyGkjRtaJ5vnZHU80Ra613AoeHBji5w4HlGc43G9bIyFgZts4lSGJwxyypxnifpXDi2JI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471882; c=relaxed/simple;
	bh=MIN0yQszQ+nWINYdAJRE4QB/HBQcklNrf7uYZzSOgXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B5cxwAg5iMJdW6sg4P/sXYlJvRTRDfsvzgKzddEOd6OPM5OKC090KpO8wGOHxM+yFu+cYVBOQEB40IdqJ9yDgJ2/f09bxUH1jBmx7hyMnA5ytWQYkJsz1kMecJ5pF5E+dBOxaUA4Wjy3HhbNWadLsZkNauC3D7IZKM6Jpq3t7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EaXsyWFS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EaXsyWFS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so29094995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791471872; x=1792076672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrVdfGfe0JNoSxkKZPcIsLdVTwOyR409O5kxL0DcF+I=;
        b=EaXsyWFS5GZi1l7WOXsVlCtMfSIlfNj6ofSkAPYjIqgBq06ishANeYlq77nEceomT5
         0vQ1xT4I4MJ1fTitu3Szzoiozi3wXw8r2pnRS81Q9ji27Hej3L/VQh0uyQzSTqTYzGqz
         zu2cXdlPg64En6fKePhIjrSBGiGr2TvtOhbj85MWldVd8n/yw7At8y658b4xaE7pT0s9
         xDuFhHGUxEwK09TAxbp3e1oq8wPu2qC/VGQGZw6kxAQbG1/gGgiHNN66PxLniFWIChRp
         1F3ioSgSd2HOgUabzm12j2m5FetvnkFCbk2vDufD5HbBlAfp9yVT8h20GDdcU+egGIYH
         CE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471872; x=1792076672;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrVdfGfe0JNoSxkKZPcIsLdVTwOyR409O5kxL0DcF+I=;
        b=MaWlHThOr/ZbsLY7dgOoHYpkivzSZNCtgumZqc//saGxG6SN0ATIG9YMqUONjj9VZb
         mNHv396nkd9DcOWDMx/buRj7wsEtawgn86uYTY4oD6Yf8aCbVcxAZ/+NCskWgvnKyG14
         pR4sSbmEKrS3MPNJqQMXc8qDXVQrtLtNf3zYIDTNTNYbiEORjV+9QZ5YARokXowBOJz+
         YfV1TNOv7UfVHyWruhpgHYNGliPqDhyUQSa0eiVijuxdAV0QNVHQHrMOpsfllQ3TvMq1
         gj2Fh4Qg30nAR5ljt7LdQS+fuuLLQvfz0KLTr4baKdftustjtrecZjljSb04H6KGfzmf
         n00w==
X-Forwarded-Encrypted: i=1; AKwUvBy93XJdRbFv2yLk6Y8zf2es1zqJB9i2sNoNV730QmM3DLwHywMhv4lfGkF1RC9LEk9TJohjX2Ol0ZJ8AZE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1XyKV2F+Kye9/TfjRrvxCx9JjihVtHAvAcbaTKtMmISWORg0D
	Cf+KmPM6W3Cvd6UV2vuDyVaTF7hOusLNssU24tYcfeYTvQ/CZM5dvspvYx/xgZINZGA=
X-Gm-Gg: AYBFou1cdaKdxgb/C8b+9lWs49IyGxt8yfkiI7kQxtQ+49V1w11QijnuDsNFN/1M+0v
	HYAOPPMHX0kcLIoXQqUoIWsBPk39491RlUNz0VO2g+bHkV9ewHamQWfh+Bcy+Htn5vyxfnuN5gQ
	+DUJbwBwLMwaB6I85W/0YhWEKh7uJztWN6C3sWYkublo3n1BoEOluHKrAPPqR9cChaI5FYJAt9f
	+bLFZSCyj6pKeMYPBTdE0d9bs+enhjG+r+UN77gWh8NkIUhbCIaz3oJKAOrhv+GYlxdmcRetYmW
	0XzoBrF0W50hbjOlzKD28PGxHeGmOV/YMwPK8TzQzAPtoyHyK3WLFNZ+KUs2zwWFAUuvXpH7itS
	uCKDbX+gQ4QkMFx4kDL4dHacuCtR6JeLmdFbQhxlwH24lx1hvvUl71atWmEEW0PR3FAJAEcuGRi
	NRkFuhE55Z4CDG2uK0qocglTUihGekXkfBPQy/X7Q1RI/gfxfL3LqsyiQgtoKcT9InU8lBc+KJv
	GW/B2EpZeaa2mds
X-Received: by 2002:a05:600c:3b9b:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a180420135mr122032655e9.19.1791471872332;
        Thu, 08 Oct 2026 08:04:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm72865765e9.6.2026.10.08.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:04:32 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] resolve_btfids: Fix the --fatal_warnings exit status
Date: Thu,  8 Oct 2026 17:03:08 +0200
Message-ID: <20261008-resolve_btfids-warnings-v1-1-0d4e613ffa6e@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261008-resolve_btfids-warnings-a356edc7a5c6
Content-Transfer-Encoding: 8bit

The resolve_btfids --fatal_warnings option is intended to make the tool
exit with a non-zero status if any warnings are reported. main()
initializes err to -1 and uses 'goto out' to return this status when
a sub-operation fails. If no error occurs,
'if (!(fatal_warnings && warnings)) err = 0;' modifies the final status
depending on whether any warnings have been reported.

Commit 522397d05e7d ("resolve_btfids: Change in-place update with raw
binary output") broke this logic by assigning the return values of newly
added sub-operations to err. As a result, successful sub-operations
overwrite the initial err value of -1 with 0, causing the tool to exit
successfully even when --fatal_warnings is enabled and warnings have been
reported.

Fix the issue by setting the final value of err unconditionally, so the
code doesn't depend on its previous value.

Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 tools/bpf/resolve_btfids/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index 37d7e7224207..2a93517ca9ec 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -1842,8 +1842,7 @@ int main(int argc, const char **argv)
 			goto out;
 	}
 
-	if (!(fatal_warnings && warnings))
-		err = 0;
+	err = fatal_warnings && warnings ? -1 : 0;
 out:
 	btf__free(obj.base_btf);
 	btf__free(obj.btf);

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-resolve_btfids-warnings-a356edc7a5c6
