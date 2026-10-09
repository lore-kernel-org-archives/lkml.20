Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905333D6F7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511489; cv=none; b=pLuQXZP0WMXXvgWye205koE2NR+PEA1vB22n/piBx6eSYLmXF1nfL8AJt/F+88VULkL36RcNOKifSUvaD2wXaH9YEZ8thsdPwklc5/jBu8I37O0ScZ9fFDCNz5AUzHCpVuVEMDtzm9YnzFkC6QLeemgPEd/uD2tyEi/abno6ph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511489; c=relaxed/simple;
	bh=Ir7MgX27vMUb2Apf+h3LJ/iJ4arup/JT+v11T/qNDPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3OugwDs7dIQTesGZs2E+WUvdNwEVPio41xMxTrZFgCrgpjbd9jqy5VJh4pdTd0u/AnoXW61dSjj5CJFlMS/30GwpmtiB1H2e9BwlPAlumWR8va+JNLiP1bN9jSUWWP/0eVCrhX8wfEMPKKLKDMlb/0HhIuz49hlNY5dIvvevSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwZA9ayR; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwZA9ayR"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so8386385eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511487; x=1792116287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNS0qOhcnpeatXmssqXfSOSgncnW9wacWfiHik59GKA=;
        b=bwZA9ayRCsILVSYooSCI5ZGTsa4Mp67khhtj4CH9EpE0myKVBD1kFAi403iKpM8tMR
         KuM3J52VdVlGz6EgdueUbGJA+sHusyQQWEdd0GIr0ncX6BarjK49fMryMUZ+di8z6AXu
         ZJM9Sxv5ONtJ9fEqTeAEWSXkRvgR5/8L6WthkC+YJ+YkDmxNsi598O/QSPu6P8MwuCbM
         lxGLSJXwZZWo5jOyUnK8k67QMn+ARGbkSyDv3qsCs2qo1/Pdj7fRCM8QMZF+4EHofZAU
         RG1HXrq/zlaYt25OsIH3+h3ldTKhOcjaCxuHDbdNgkvZCdCUtzzHWCIaTEUQYnU3Ryvs
         l5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511487; x=1792116287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNS0qOhcnpeatXmssqXfSOSgncnW9wacWfiHik59GKA=;
        b=2F7Cm4abT9QY2zErJqJTWKbTKAj/Ee7F9UNAEINpphABruPM8d0PkFn3sbp8q0UpZs
         PFVJFw6+jSFZAPXzYO7TMB0IhppT5uxb1YkE+eoyr55aRtO+8QlftJ4kj2mSE1rMycFP
         xb+0lC4dRcHJMuPj2AlWA3UKhrcmINoYwe/2COF2mptzsIiDrRycXyctTxZvTda29VBe
         2pJjK1BzU8AlYFYmVzTtuKB42NXHnbyqJsQJ0Tnhqu4zL3QoP19EExQHIGxeF6tFXQJq
         oUXU01WPUdL/kr+XGrc3bkfSKbT0w1/DHDcK4dfGzZfDtUcbDSTm/Ngng/teZAiJXSmy
         dkCA==
X-Forwarded-Encrypted: i=1; AKwUvBwEnN4mDV6RW3mpwG57vTRSOVfA4xMVUkPW2mcLZcoLRR7e/3Py16FFFncbNOotZRV98iwPxrz4j5yEkww=@vger.kernel.org
X-Gm-Message-State: AFuF++mh8qEHF8LbZwhYp6aDzEXFakjHWd5i4LFutxKGueLMpU+XBP2r
	jpxw5ol/5Z2bC+dNbx6YSrvLJZrjC2dDNuDmkxtePecIp8T849PR6NRM
X-Gm-Gg: AYBFou1YY0DXiQM7sr+shup+FyK+cMEpDt3YcAO6Q3tBjTTj6jAw45ijJAMQFQXtPiL
	mlAveduALPrQlMTPwzHDf84bNWsORlJDd15aY8v7QW3LS9ptNwEpRJqLLt9FhTSxZidhrHgt6jr
	1eSnt1ffQxF7XTG5qXnCAzorAHGl6mpa4k/m46OK/t2DFFWmhNmGKZu5vlE2qzNrs5LYQoh5U8A
	TkHNKjEdHEmtnPDtk2KqIpifRWq9aE5vYHFUxeYjSy24lw6oP523RdnDeBUqtU+4HckIUdthHXb
	cxPwRCxd6HodQqywih3GzYdCIw6DbHChqT1OWYUu603pmZNc8DB8u85W51oKX+73PlNdN64bIz0
	V00IKkVFfeThRtg9LV46paKmZfEmv8kujgXkce9E+C+Jg5fKFq1nuIOU6c8rKFxf2wkY70RNLgX
	s+nMGcEQM04W0QexoE3Tyg+ND8Siek64tkAZ4HFfiiEYryTNjDvx0DW8WKF5N7soWr8A==
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr564383c88.20.1791511486741;
        Thu, 08 Oct 2026 19:04:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16996eac537sm1970743c88.1.2026.10.08.19.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:04:46 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 10:04:37 +0800
Subject: [PATCH bpf-next v2 1/2] selftests/bpf: Keep the bpffs of
 cgroup_hierarchical_stats private
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-1-f93a111da992@gmail.com>
References: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
In-Reply-To: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Yosry Ahmed <yosry@kernel.org>, Hao Luo <haoluo@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

setup_hierarchy() mounts a bpffs on /sys/fs/bpf with setup_bpffs(), and
then sets up the cgroups with setup_cgroups(), which moves the test into
a private mount namespace.

The bpffs thus lands in the mount namespace that test_progs shares with
the tests running in parallel, on top of the bpffs already there, and
hides what they pin. cleanup_bpffs() later runs in the private mount
namespace and can't unmount it, so it stays there for good.
bpftool_maps_access then fails to pin an iterator because
/sys/fs/bpf/test_bpftool_map doesn't exist anymore, and bpftool_metadata
can't find the program it pinned in /sys/fs/bpf/test_metadata.

Set up the cgroups first, so that the bpffs is mounted in the private
mount namespace.

Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchical stats collection")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
index 3bd27d2ea668c..ad19d6d41918a 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
@@ -151,7 +151,7 @@ static void cleanup_cgroups(void)
 /* Sets up cgroup hiearchary, returns 0 on success. */
 static int setup_hierarchy(void)
 {
-	return setup_bpffs() || setup_cgroups();
+	return setup_cgroups() || setup_bpffs();
 }
 
 static void destroy_hierarchy(void)

-- 
2.43.0

