Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA29336EDA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510581; cv=none; b=usUq+hjnroggrsda7Z4P5IPQUnoVCg3fp5vnK/RLe+xcqrdxmelMWyO8okG0ZGV0mCBGkyNzZBen/UtqZANqAj8QPaHizUvNiRiksaZGYh+2bMsAnyeNSYLvT632FWwWvyq/LzWB77ISqWzl0ulqN9qNiFSrX669lUoox+YdC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510581; c=relaxed/simple;
	bh=THhfXb+U+XP7ZYgwkXJ/3sH7l2Fn4g3IOzyG6H+bmkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mu/j2fyAbZerJufdi6o73yjkpPOIFYD5BTbgIx1omvvP6m3B4QTF2Q29+U2P4rs3+I/OR97MxsiOnlX4+dCKMu8kj1FoOaIntay35TsEqL5gK9RqmKOAm+zDarynqtEIaO/4di8IUCjWMJa3ZjOdvdw1O8IeYEoH3ovMAhu0l9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUro7FXb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUro7FXb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-351775aa1c0so2141097eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510579; x=1792115379; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xfjq8Lb4LixkZlBGmvrpE+e8LfVmt7BcDqgbPU9H7wo=;
        b=WUro7FXbQ7dwAZo5ZRV0i4OqcZX+sPn+6poJdr0sKeFTMeV0YC5k/sVjIer6wf60j4
         kMt4G+WPYfO5EW6DN2Z6DpQpVhqtejdXiBGZD9RGgafUfQimoXbLXlqDnDtB50OOMs5r
         yo5X9nMJNtvI/Df5w+7PuUK3TtOAY2UWcq2Wokwi9ER6B6Eozw4RpsP57qyMy3O3J/Zq
         spDdFa+WerOufW+J9Etyya29mNELW31ZdraORHQcCceKHEEEggsme9eAEfGK8dFAfZVi
         QZyrncyStk1y0JRGPO/e40ZqNfUjD0LDPBUimQq2dtpcAhOPIpqPMfViZcGKNO8fuA56
         ygDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510579; x=1792115379;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xfjq8Lb4LixkZlBGmvrpE+e8LfVmt7BcDqgbPU9H7wo=;
        b=HjEblyjnbadtig8MalHYRq357WHDIN9TULfW+0L4aIMQZ8n9hpAvG8jG0dSavPjFSB
         kSCq7OMPI9GNiXUZr3TiBCTzrS8sZhUD8S2empezvAUxxkNxSmOO9D7VY+btg4BWWxiT
         XcsISigPR1wxDBvLgtJCpritgh3gHQ8a9M24vafTqwqSGK8EPVV7bcuLv0kuxaKjbQeX
         7DZUXTTOEK68ulOFBmCrwvSq7qYX/+aO2SaQIFYCq5FS9Rd9Ew3xHyKl4ixQS2oeo2ko
         Ss+cfj7syjekMLKZ/Z6H+gXI9T1U4OQRxoI128NJpxAsEQ6hotiPC/xqaPO6HNDcuiU/
         2K8w==
X-Forwarded-Encrypted: i=1; AKwUvByld84lGgTLAcNpvV52UYULAzQHU5lA96WFap0njnQ810ZmDH8ZhQ+YdwOCoVfplH1CUs/G2TvTvFpwd18=@vger.kernel.org
X-Gm-Message-State: AFuF++k1rF2Dsl2Joq52D77Uxy57uyjHb/EcxlMOGAFUIBOKwsfSVgg2
	/1jox3jWzP/EtzUkCfjPM43uLLFxzHVmfPfT9VPvKoBev5YRaNItBnL4
X-Gm-Gg: AYBFou1dISSYEgSvPoC9XzScJLsfPVRRtQNg8WmaJ4XMOPcI7knaMA/6hiZR3NcMFc5
	KBGmXIEn+DrGzTvi11ZOdl7saDVDzkrMTP5Ie/8uV5JF9mAwhNSNxjXbO6WD2/BMxbggOHmGy0Z
	SWnslgwpNbB4jZnJPE9BjiDc84PmZ3GBl3b5cNRTzEwbrhPO8/neRu66fYULBbCIFbuG89hQ2mc
	oFtzo8zTvyMTC3ZqT21pO6fL0sa+mJioF207cIHXI4V24EbJCFuLEFpDTc5oiDy5+TVQWllI5eD
	DF+iptr3iCDi0So03O/hErR+EpCc2n7NXPsSD43Xi/rzrORAgkzwndrgSRJCrx9Q3u3ANz+45+h
	DCNU/rsaleh2U5jXQRPxEG8IEljTKsDxL2X27rJ6RnWVXjsORL7lV7+jl32+Iyo0h/1mHmNXHnV
	qe3Ch962AyIUyWkSkdDqy7EXIBvzOe3jQXRL9SVWmixwCoVno4nPlJ73IBsc8Uo6GXFD5tKLf1Z
	RoH
X-Received: by 2002:a05:7300:de0a:b0:351:248d:d63b with SMTP id 5a478bee46e88-3537dfc6a6bmr800021eec.11.1791510579152;
        Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm2009262eec.16.2026.10.08.18.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:37 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:32 +0800
Subject: [PATCH bpf-next] selftests/bpf: Run the cpumask map insert tests
 only for the test task
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-cpumask-insert-filter-v1-1-3249218594d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACtIyGoC/x2NwQ6CMBAFf4Xs2U1aSBD8FeOh4qtuxNp0F0NC+
 HerxznMzEaKIlA6NRsVfETlnSr4Q0PTI6Q7WG6VqXVt750bWTFHg5ryNUee8vIK+mRJtWMcZTY
 U7uM4IHTDsXOeaikXRFn/lzP9tITV6LLvX1xT3HF/AAAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 David Vernet <void@manifault.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

verify_success() attaches each cpumask test program to task_newtask,
forks a single child, and expects err to be 0 afterwards. Most programs
return right away for other tasks than the test one.

test_insert_leave and test_insert_remove_release don't, and insert a
cpumask into the single entry of __cpumask_map for every task created
in the system while they are attached. test_insert_leave leaves its
cpumask in the map, so a second task created, for instance by a test
running in parallel, fails to insert one and sets err to 3. Two tasks
created at the same time can do the same to test_insert_remove_release.

Return early for other tasks than the test one in both programs, as the
other programs do.

Fixes: 7b6abcfa15cd ("selftests/bpf: Add selftest suite for cpumask kfuncs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/progs/cpumask_success.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/cpumask_success.c b/tools/testing/selftests/bpf/progs/cpumask_success.c
index 36f77b9732d46..ddaba4318c574 100644
--- a/tools/testing/selftests/bpf/progs/cpumask_success.c
+++ b/tools/testing/selftests/bpf/progs/cpumask_success.c
@@ -460,6 +460,9 @@ int BPF_PROG(test_insert_leave, struct task_struct *task, u64 clone_flags)
 {
 	struct bpf_cpumask *cpumask;
 
+	if (!is_test_task())
+		return 0;
+
 	cpumask = create_cpumask();
 	if (!cpumask)
 		return 0;
@@ -476,6 +479,9 @@ int BPF_PROG(test_insert_remove_release, struct task_struct *task, u64 clone_fla
 	struct bpf_cpumask *cpumask;
 	struct __cpumask_map_value *v;
 
+	if (!is_test_task())
+		return 0;
+
 	cpumask = create_cpumask();
 	if (!cpumask)
 		return 0;

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-cpumask-insert-filter-6f98ea387301

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

