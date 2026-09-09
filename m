Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02B577E48
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965666; cv=pass; b=NSed8fuGZ0wK44NLynLrVgljG9tNpcdyVw1jnPnFdZMA77N8ikDQSSg+0EKkU8brXWqCSmh5hlfIwt9syWOkzvrjapqAEPn4EHdp8PvIFHAqEW6vXj1uvdU1WtjTVoe3yGHyC10Oo42m5ybpSeks/rgmx6fUwWW/Mwk0DkFw8So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965666; c=relaxed/simple;
	bh=TLXolKG621p2LkxjBgzjDjrxBq4R+3i7ra2dwhuU64M=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnSbdEGM/nYhssFo0zNvTldC4R8j2AtlmSsY8q9nHpI+JZffQhK7gOgV/qT6EkN1ufS/iEu9VvBiyWwEyRaWzOmpuqIhvWDxy8M9v8rNkphjglKV64+kRrwTTO/c5uBPsPy7cjStQcoTz9D5eMwCIv3pXPf+VdQbIrt/BZRVlSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeE5oezn; arc=pass smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeE5oezn"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-53096696963so14330621cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965664; cv=none;
        d=google.com; s=arc-20260327;
        b=HSNJIaigmi51jEDAr9fhosojakkeNJBqCXbuyzytTLjhJKuqqIAs8QrgYTfFTsJFOr
         5NVGpSqwrFPW51F2Qup4lASYaulJZMsc85BVCvFxMijA0b087Rpp9lfIItvsjUmU3RBE
         TGTq+HrHsjoOgRcnrBK9TV/3EUETquCubMOtJpHU877FUKQO2oFUYyBxLXboTE2tlIuR
         5TtWfvGW01s7GQB0HtvyJQrJCdl/r3/jG6savL6iYXzb2id/xk3qfktbINkGxx2+zB/6
         /NfBQxJjI5xpt9rVZlYJBn5KM9JskKcdCFEq70eQHpZaQrJLGZQFpp0Kb1evCyqp/cSS
         BtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        fh=k1aUXi2DYN8PsH2+D6sM/twkrEOQYvx2QKqdgPGVhBY=;
        b=qzUWgKCnpCZ7V9jvuBYhtE3bQn3+6j07QCTtjmu5idInIvOEQ/TX+F2uKfqDssMjS1
         i/RB+wj3+25DFsUzreZkyqG+Jk6MeirisuTkOsCVTWaxVDs6Wn//QdflTHbBzqSqBpVQ
         C0qP/D44U+9G/c5uHuXkrZLmHh7BngzuHCGvQzuppZBW0kM8kgpqkjXoPETUwFcig+7Q
         kY5TNmP6UkSFMstt3ss4IgZEiiKDgkuN5IjjLINXar49r/EfAJc+6ARQeXHtJ6OLcvBI
         spZh0IpIILrN3EThDJAFvyDWyVGfmY6OzSU5ZrIE2cg+Sj3ukrgn3NhNdHntIR8iIv4C
         UEqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965664; x=1789570464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        b=KeE5oeznwFhBKfr5dcKoD3DVrj22T6rnbeWg4sBn8z8vypSuZKtr3av26mBxOF6+ff
         vPDVY9DdwxlsqEnnt0fHxNYBIE6nosyzn8Y42ObKcnLaZ5EoO48fWhZCik6kvbkflsSj
         SRgME/FYafbyQ9loSbvA5t42vumn83ncUTjdKGQ70u8RI0XWaiZ5l4bYRZldk84sUeho
         q5qS/a8pL/0rPcjNho/m6zJzHTh1h0Lpf8yDBB5U21XOzZINliRdWXihFdWM81e4ARX3
         nLEzF9ynx+bQ2qF9RiTOJv84E4Kqid2hKl/ZG0RnoQwxJh4R0lrite2/BY3f4POxvyWh
         vimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965664; x=1789570464;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+ctEZD06peNSR4eAdlrxlVUiCDE+dJnPzXeAForwRE=;
        b=hchK9HmfJ2rVHf0Bt7tfBrgx/LB1VBypcCN5jHL4hVoE3zvGiPy3D8YpxeAwiICz4F
         8/zn0trGfUXcuDmTUa03OrUuD6CcAs8pPanPSBri2S6+XdQwc0h1sXv736ybnAu8ZOMY
         pljDiijvHHacMYvbI1Od1UY+sQq1vlqbpGvHMUFAQaK77zv6Hw0xoJOeAEBww2RM3LDo
         h+jd0uWfK1u+/lq7ruAWXaFtdBIqacodrfkKoCIEghsMbdBNithw1WOpRpP8R7254AcZ
         heErCdPFzpOXa9lNsxseDCGqyofpVZwPe652s0NScFyBFfUOCxzMPxLV5+U6sS9Z0Eau
         1FDA==
X-Forwarded-Encrypted: i=1; AKwUvBwCQKTasPTDE6mLUMKQK34f78sdCmTIGxwB9bCv3wn4livWIeF73cuJXbIcGANpb2FgCLzTgwmHlLI62MM=@vger.kernel.org
X-Gm-Message-State: AFuF++ngNbrQP81SbHOmKuKSGU2h3Rl2ji811X+S50aBB66wnHfmhqq5
	YzZ2QZ46xEK44ttNWLDdZsiO5g/BfmM5qyphRkstdfnAyv/aMSX5WaE0ZnO42W7MiTokt30FPeT
	cwSIuao4iVZ/zcPWGB7NIO/fkxHLKuOM=
X-Gm-Gg: AYBFou22dkwst5r9pCUBTSc8jWKexKitZb93uWY/YG0BiRLykO+7GWub9T4UlbGwPLX
	qK41hc4nLGtm50smhVsGQ0F5+uwadvZJY7Rl7Yukgxzqo3KSDKe6Wb25ldNCpughdBjFZmu08ld
	uMm9RHP2ODs4M6X2vG22R4D018rGPpFcl1riKD5PsoDFvHqjNF5tr0MKoFpGnzQWA5yjBHpHOdg
	MhFupP6np0staydNfcrSLz0wVVg1rkVySDhvLv4tu5D2N/6vLQ+P+WhrHVvS3/3fQduZpmYTfis
	UdEqaFqBq96pln3DTgfo1YAomG/vjWb4n90pQkqIqVF6Xxx0242E/g==
X-Received: by 2002:a05:6214:4a05:b0:910:4874:66e5 with SMTP id
 6a1803df08f44-910d104bebfmr25031596d6.21.1788965659974; Wed, 09 Sep 2026
 07:54:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:19 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:19 -0700
X-Gm-Features: AcwNN1UNxzL5WjMgcuf3-e2gvm86CJeujKJF0gUL8RZhHjcliTNAwngLs5rsPew
Message-ID: <CACGbirR9PNt4uhqJFATsOWnwmsNb-v8zau-Rb+9Q5SZmY-=Vug@mail.gmail.com>
Subject: [PATCH v3 RESEND 1/2] selftests/mm: Reject invalid test selections
 before running tests
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Tianyi Chen <hi@tychen.cc>
Date: Tue, 08 Sep 2026 11:21:21 +0800

getopts reports unknown options and missing arguments, but run_vmtests.sh
ignores its error result and continues with test setup. An empty -t
argument also falls back to the default selection, while unknown category
names can silently select no tests and still reach setup code.

Exit on getopts errors and validate category names against the existing
list in usage() before any test setup. Reject empty and whitespace-only
selections, and normalize category separators so validation and execution
agree. Initialize the default selection before parsing options so only -t
changes the selection.

Fixes: 85463321e726 ("selftests/vm: enable running select groups of tests")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 26 +++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh
b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..9e62ab4c6775 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -96,26 +96,44 @@ separated by spaces:

 example: ./run_vmtests.sh -t "hmm mmap ksm"
 EOF
-	exit 0
 }

 RUN_ALL=false
 RUN_DESTRUCTIVE=false
 TAP_PREFIX="# "

+VM_SELFTEST_ITEMS="default"
+
 while getopts "aht:nd" OPT; do
 	case ${OPT} in
 		"a") RUN_ALL=true ;;
-		"h") usage ;;
+		"h") usage; exit 0 ;;
 		"t") VM_SELFTEST_ITEMS=${OPTARG} ;;
 		"n") TAP_PREFIX= ;;
 		"d") RUN_DESTRUCTIVE=true ;;
+		"?") exit 1 ;;
 	esac
 done
 shift $((OPTIND -1))

-# default behavior: run all tests
-VM_SELFTEST_ITEMS=${VM_SELFTEST_ITEMS:-default}
+# Normalize whitespace so validation and test_selected() use the same names.
+read -r -a selected_categories <<< "${VM_SELFTEST_ITEMS//$'\n'/ }"
+VM_SELFTEST_ITEMS="${selected_categories[*]}"
+if [ -z "$VM_SELFTEST_ITEMS" ]; then
+	echo "No test categories specified" >&2
+	exit 1
+fi
+
+if [ "$VM_SELFTEST_ITEMS" != "default" ]; then
+	# Keep the documented category list as the source of valid names.
+	valid_categories=$(usage | sed -n 's/^- //p')
+	for category in "${selected_categories[@]}"; do
+		if ! grep -Fxq -- "$category" <<< "$valid_categories"; then
+			echo "Unknown test category: $category" >&2
+			exit 1
+		fi
+	done
+fi

 test_selected() {
 	if [ "$VM_SELFTEST_ITEMS" == "default" ]; then
