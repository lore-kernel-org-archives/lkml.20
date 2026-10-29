Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255089;
	b=amDINhrU3x+B71FD2ib9GwMAeMVmPpin5zyMQ6v4dTUSxtWPH2U4zEMEZyzMMFObM+MP
	 YDhl7KmIz3H9ANgp+cES0EDYkUD0Vcvgb9wEa2dZtGNR4TmV0/w9FQomwjUH8TR8/Tk7F
	 /DLvGY1LOAT7kph1xB8mK/l/V95dP+ndaI7uTGOdM8HkvssABC8mp2VQwDw3NsluxogIo
	 1oNeImS9d77JvalV/EP+r404yye9m1FvLVmfmWq8CDBOxbJEVYLu69LNT6JK02Foa6WEO
	 +v7ptW0htMrl0kQ5i6btAKpj52wqTigM3DRcgB7fCQwPU2rG008rAkCQHowCxb74fLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
	b=vcBpetyRWTK+6Qh6CYCUpbORcu7g1YXFBvnWcE8llPN41//7EhjmD9dAVyDs+69sQK9S
	 NvGZGWfTYsao5cEr4OzB84mCqQYyLnvUhwHSZfoF8mz1DauhIWNCvXI8uNnv6uYtLN9mF
	 rv2rr1ma51Y7il3GhJp30sXdu7OuCdwm7yUruiwOuNcaJrtecQwmQUbU1Xiyp/KVwfydD
	 E/so40FmqT+AfqOkkOrXClfYfDAHrWOVueo61wmXo8SQGkt6N8f9v5usRkQKqhsENkU7j
	 MxOqszw/nnokVlGHB3o9f51lmO2CbokOalGIVxPsA1ul0xAyZUmY80u/zHwZDITi/MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntw2xBjL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE79606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntw2xBjL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so2896619eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255088; x=1793859888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
        b=Ntw2xBjLx1jCLiCYxOf9f5CBNYq/fjJHvxouoXHdwTmFEVd2kk1dnKLR3K8UViwajy
         VX/5aHC9QDSqpoe0AYMdF0pw3YxblG4wV4v81FhZ2xAUNON6RfpeICt2tBKLkN4GFgMl
         IW55pHwNEZzOWjXMjAPiox5c+99hZS6EQp33nyz9VS/C4V13iz+D1UShpH4eY50LiJER
         JLci77NKQCA6/SP7FKr0LQFsIn4EoRN2fOQYK9XJXV5U0J2pL+Ilj00q8nOxtdiH3Qd4
         BivF7MhsgrAVf5Fdj7NoI2llG5otZZBNQiZY6GOyjGRmLBapGhSNCzg6ye8icHMVRdW7
         c7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255088; x=1793859888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
        b=WgR8aYajhLIHzJ3FAa7u2+QFKC5Thrp53S0Ol0WO8Dfs1BtiAJ6D3/FKlnlkXrCi9b
         3ozZqXnCV8WWFE0dXEoqHIO7zoflTErpAC26AobboqI/s9+lii8TMJX7QB9zvUWgslci
         rEYdTyxQYd2CwiA7HMSFuPBlRGLnxMgyE4l0O11o7/YVxFJkd4q+nhZjQcXj56StUjuM
         STqFm9QhfIBNm9Nc622qxv5ZJAEU8VZqNxuP2zzfSpf/CT3brldnSPCfyIki4jiaen/N
         vm/fOo5VDTnwSwWSdd7smtM7p+/grwOCV8dAnfuKWPJ0mdUIl4zgZOlMhmF8l/lAtaRv
         I7rA==
X-Forwarded-Encrypted: i=1; AKwUvByZAisR5scIIhiSkYoxhDbSWS+wLJIAvg24wU+ZOy5vArS1VKYOOHKvwIO0HBSKf1xfbhqgMKAnaiEjc4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHVXgDI8CK6zHbkz21HSuyFgTR/tMzc0JnXH6lMVlPFNbXxGUN
	sFGmLQs3TJlL63RyMJalso/1UjvgDlRIZ6OdU2ZX2F95r15S07us8rWg
X-Gm-Gg: AYBFou0oYLDNjPdjfNH6JSQKWCXrK/WJehu+T8K9hEcjAopANC0SlVzbuIUGuElpxYQ
	ioIv9/fqPTrJNKL0lCzA+jSYFWZ2G5puf21BPKcK8LBJ6iKm8YVjxsXOOFZHq4SN4gKN20KB1Ca
	5JVYihwhhiMUCSza+xguGlVM+DLX6Zjeb7srFcYyLOEbVRpCvdMdU33eXjwC2BBAFRmXOqSbqZW
	Pg4qCC3D2pwVTYwnGZlG9y0eW5ScdHpD6Bp0HoDu3BkvKA1flIxJb4fjM25LZWc6JwEStL//Zpf
	PSYcBeWYvSku33Y62P+FzGHZLoiNRIbdQNstTP0VAwcA6H5BTGD4oGSn51ZEyD7GnjAKrCjyjMm
	R46BR4bNjO3j9gusboYiIrO4XhkKljg1q1zHiC03I8qxKmYKxRhFoo3SU8ONUkB/Hqlmf0cM+VS
	mXNjqCpU5IA7wwFkOoiUDUGsku6D1MGO7O0CRFgzT+9Pe1TDgeeC0SsAWbPU4+NRm+ZUNiO9GFq
	ZX5tq3xMOZlGEFEK2wU1vezoX4wZ+MxHa/tJJOs2cENUpc2kHLX4fOns0dm6k445qr+W+07+zpK
	uAU3nzEPCtAULg9ZHrfhJoSa9Q==
X-Received: by 2002:a05:7022:7f06:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1a8ff0ba512mr2702485c88.18.1793255088321;
        Wed, 28 Oct 2026 23:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2152004c88.3.2026.10.28.23.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:24:48 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 29 Oct 2026 02:24:35 -0400
Subject: [PATCH v3 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-1-16ad772850ee@gmail.com>
References: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
In-Reply-To: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
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
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedaee..e104a9c6fdefb 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -171,11 +171,30 @@ pretty_name() {
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
@@ -201,8 +220,7 @@ run_test() {
 						| tap_prefix
 					skip=1
 				else
-					modprobe hwpoison_inject > /dev/null 2>&1
-					LOADED_HWPOISON_INJECT_MOD=1
+					load_module hwpoison_inject
 					if [ ! -d "$HWPOISON_DIR" ]; then
 						echo "hwpoison debugfs interface not present" \
 							| tap_prefix
@@ -225,11 +243,6 @@ run_test() {
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
@@ -453,4 +466,6 @@ CATEGORY="memory-failure" run_test ./memory-failure
 echo "SUMMARY: PASS=${count_pass} SKIP=${count_skip} FAIL=${count_fail}" | tap_prefix
 echo "1..${count_total}" | tap_output
 
+unload_modules
+
 exit $exitcode

-- 
2.43.0

