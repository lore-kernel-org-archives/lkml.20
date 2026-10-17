Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327941D23B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249646; cv=none; b=NPxrciPqvqT0vkJBMdTimuiGvg5pdEucpPopl7IYPd8kVcIZS8reqPA9nI6VdpKwHWQa1AIx7+4+DY4ZzfqrYY6qjQ9IlukVdGp1dX/+c354Yu3srZkpGPf9XPIZw1BuhSwaJDB/q33oSDO71Nv1QnKQFKgDhkbMvs+AtHwWStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249646; c=relaxed/simple;
	bh=ltKFVKcfOm6yYiNRVudov9rpqK5knEbnpjkack9/LaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7rThItuAOQYNAa/4lAjR8pWBQDqJMnaqecIaGME+7Sx3mOlXZTnL8zsDa7Vr2Cmm/+hrLQnHWltAxF+S6RAVca2chZSDXz+HOWqUoeCih8B+hslH0v+OwkohE3slqM2ey/wp21i9uaXSDw68oe5rPKlwj9VF5qmXG/6+5f0JpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsgso+kW; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsgso+kW"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15943c9c005so619290c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249644; x=1792854444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiCRhwHnJeO8E2bgX4UvDZxJcOrRqOmEG3KFmXJoYDM=;
        b=Gsgso+kWGQHb1E2StqipxRXRweDz1as1E2kj8CgEtticKhViZUYU7QlWjQFLNuaj6c
         FMVQNoIFjlpv1vNXfSLnWDwEJjmK9h+Nsj0pb0eeWI2zb+mT4C2GfV3h+R3Uiw0jUOR3
         JjfylUIadLGIcPzEAV+LzHEyRWKn5P9Rvp91tdnmvTYYD3ujSkh/WJyThsxs4pK9kpte
         L31O1hZp1ZO3dzRLoieT+15LTU3oM01ZG60VJy7IW2w9HAxTlrsnizXOcHttp85N7aCp
         k4jlDafUqC000GX6+pkgskZL0cnSMhdYzYwtH3YPwPrgJLlXtK8y7d8rBOwmn5c29UMG
         3ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249644; x=1792854444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QiCRhwHnJeO8E2bgX4UvDZxJcOrRqOmEG3KFmXJoYDM=;
        b=rAiYsEOb9wBnfJljqEafi7cGhAlq2RTQ8Mebl+g2+x6mOXRv0TcAToWlaY60leJm7y
         09/ClSxCW/SHLkga7RjxSRyVTupjXl7VUByTTEppzKQRWL+tgSw8SRWnoHRZEp6itwTQ
         YarS4RS1lAXokPR8ItfH+Td91YBT15fvfRfLeCVv1NsTRasZTCe7FpQeRdGpM7BO8bzu
         KXnkOeq0W2KWA3XN/2upxTtCi2v+Zn0uDwVrm42YMt+rh6Fx793B5pwRoVc2mZL8stmt
         w4kgQNUllQ8BeHmzoPJkyBsqj0awwuYmT/1ACtzCNZg9o7bJiETx1jlSY0RKNKwrulk5
         UQ0w==
X-Forwarded-Encrypted: i=1; AKwUvBxyVsIADoqM8IC+otIMxKul/fxonZsT4exLitMzqZuZF4rfFjGfRlul3Pc605aWAObuoXnjT0G86Nc+iAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhO4aA+TnN4r6OwcW0I0VqJH2ZCAyZbu887JzAeSEDCeF1qpV8
	hbZKg2qAbKBd+wDdluWXRRzGeJdGzusSUxSXhqopcK3VJ1LQ7R3fWhOw
X-Gm-Gg: AYBFou2V6H1HoTV0fSnI2UPX3qfUUiPj1Y+JyKXEK1JRFCZZaXnE4i/qCeJigJXlDQP
	WEq6b3R8ipsCOg+fWYiCACnvms5HJrosTQHATM+6Y7RteF32QUcUnn3jrcON4HCvq13VVZ/Qa33
	1IQyMjNBMmqSlLydBfzBTpNyB4rVP9SJ7+UfD1W0LStP9Ue+1TYD+t8PsD0jYWf5Sr/hNm1WaT2
	VTI6XmBAERHmT/F9TWthEYI3njr+ayVuLPCsMWXSJSWJ/K6xzsj3riw2w7uour/B4mFtKXESzLF
	72YzZ5v9RaI/vb7JjahqxPn/NMXp+Yoxd58mEuX6hzzmGY83qjPRFHeFwby1rwP9fAHY+XJCLEO
	fn3KiE6jVjGwd75qYwRw7RRWMJRoKj6PYJSVXeglwQwgQ1AKVSniiV5+i5+tjAHVJy7Axwb92yA
	54sOQbcOLEvxPE+ZuOmXcZUlfwwoR2qWaE8ePjkYtBXVP66xRuWGzQa81hsjYbMuno5w==
X-Received: by 2002:a05:7023:a5b:10b0:165:aced:1fde with SMTP id a92af1059eb24-185079fd5b8mr4343118c88.0.1792249644367;
        Sat, 17 Oct 2026 08:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13170977c88.8.2026.10.17.08.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:07:23 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 17 Oct 2026 23:07:12 +0800
Subject: [PATCH v2 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh loads hwpoison_inject for the memory-failure test when it
is not there yet, remembers that in a variable local to run_test() and
unloads the module right after the test.

The thp tests need xfs loaded in the same way, and repeating the load,
the bookkeeping and the unload for every module that some test needs
does not scale.

Add load_module(), which loads a module unless it is already present
and records it, and unload every recorded module, in reverse order,
before the script exits. Use it for hwpoison_inject.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384ee..56f5416681da7 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -177,11 +177,30 @@ pretty_name() {
 	echo "$*" | sed -e 's/^\(bash \)\?\.\///'
 }
 
+# Modules this script loaded, unloaded again before it exits
+LOADED_MODULES=()
+
+# Usage: load_module [module]
+load_module() {
+	if [ -d "/sys/module/$1" ]; then
+		return 0
+	fi
+	modprobe -q "$1" || return 1
+	LOADED_MODULES+=("$1")
+}
+
+unload_modules() {
+	local i
+
+	for (( i = ${#LOADED_MODULES[@]} - 1; i >= 0; i-- )); do
+		modprobe -r -q "${LOADED_MODULES[i]}"
+	done
+}
+
 # Usage: run_test [test binary] [arbitrary test arguments...]
 run_test() {
 	if test_selected ${CATEGORY}; then
 		local skip=0
-		local LOADED_HWPOISON_INJECT_MOD=0
 
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
@@ -207,8 +226,7 @@ run_test() {
 						| tap_prefix
 					skip=1
 				else
-					modprobe hwpoison_inject > /dev/null 2>&1
-					LOADED_HWPOISON_INJECT_MOD=1
+					load_module hwpoison_inject
 					if [ ! -d "$HWPOISON_DIR" ]; then
 						echo "hwpoison debugfs interface not present" \
 							| tap_prefix
@@ -231,11 +249,6 @@ run_test() {
 			local ret=${PIPESTATUS[0]}
 		fi
 
-		# Unload hwpoison_inject if we loaded it
-		if [ "${LOADED_HWPOISON_INJECT_MOD}" = "1" ]; then
-			modprobe -r hwpoison_inject > /dev/null 2>&1
-		fi
-
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
@@ -465,4 +478,6 @@ CATEGORY="memory-failure" run_test ./memory-failure
 echo "SUMMARY: PASS=${count_pass} SKIP=${count_skip} FAIL=${count_fail}" | tap_prefix
 echo "1..${count_total}" | tap_output
 
+unload_modules
+
 exit $exitcode

-- 
2.43.0

