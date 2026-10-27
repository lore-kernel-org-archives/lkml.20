Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096839;
	b=ylG35kbmKg7hQOxSwko1thDJbk8IePqh3CBbLfDbuQMGS23hPMmpupjmGOBTcg3nc1NO
	 NubgOaR3tSpi3qccAB/lrUyv8PwO284zuxMEH0CzSQ6CkDCHiDBhdckAh2Rpwq6Kbcwk6
	 xkygU+Ztkbyx35SkRST4Y1mKwhkxPJDCaswWeQNz9FFP+FiFxs/3PDLoederqvvLNSjP0
	 coFcTXqtfReiPat0ylMKP4Tk26yPg5YDGdXlal2FegSCqMYTRS5xziF8D2wU+5Ce1asBs
	 DOtsEYI13qxkInoisaF8L2WreSvQLOewA+3f5cOl5zU/9DN94THIlxQHhS1waspoN+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
	b=uAqn9lU2xEpmQ3qAJmEmtOEV/f7pKH0dkUBGmpUY6D8l09HPmpcf9KFVWBmTupnHLQjm
	 IRjamSCYVKr0JUD4SaghB2rurcCW5xoTObMaCqjXpfubjHcyk/RKQ/vKhB8KixXWonawc
	 V+2GlMML8gKMYRbD/Nj8vIo6pcXvI0Zl0Pxu/9gJVPA5UaAuzyEn1kPls0yYu57Ywdyxq
	 AvOTpptkwWkhYpPP31FJnWS3B6ociemsM5fhPVsTb7/q4sAlB3Udv1ixSjyr2LlfM/ZYn
	 EoXNrZ7L2stEC/d/lHspQ9kQg6QfrNiodtYCDX5b0xC6S67ORwlqGtfyLIfK/fDafIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwfSoBgJ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwfSoBgJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19812505e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096837; x=1793701637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
        b=KwfSoBgJft6tDq6bXl+I5s7oQzeSBaTjSZAzm4e1+cTnSQvGCCltKuw8kQLP8W/4tX
         SOeLqLr7dYv6V/+EiNO6K4NqiYAjCLgwKbZk0lo+ran5L2CtUudsQJwN16x3cZTgEqfT
         VPjKNJcfaztufn3gknvdePZuNRiiAtS4pz8GXsWQMFQhyEUvFcpgDGoKulaTfmZ0NTx5
         7E2tq871cw2bCdwy1+C62xHNCDHqoCqokpu0TyOITcabNumsfApaz5/FPJCEpN9rQwmz
         VIWmk5iPc5Fx9K90Aw3reM35yrJwm9IscqMy3naAWakXapnQtLYugO/8vj3UbKzm4NNU
         dlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096837; x=1793701637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
        b=0Go7QysHMaPOeScrKQnIVVEJREq8SdDtukH8gqeUoNnESFnKOx7cHlPOTeT9NoC/FI
         QpDf/mYdSD4ESqFwxiXQwnpMHQ1/bdxuwyDv7R+Uyzot3ndXK9ye7hJa2oN5a07C7Zo2
         BDyQ4MFXNhv5U1z/ucoVKDwUoIiRmsR6xxFlzxS/CpnPC+u3hsWoiv5D+nhuCqXclodh
         5QlNXvKsH2DJWeJn5kAALRyAwHpgAcpV36Zi1+3MoxH3PDixhKq0ugaoDPa+iWZ1rKpR
         aURl84Z0v93I5YSj7eP/By8s1SxeszllgTz+B4ao3gXzwUQ3AOJm2MD02d30b28m2JbK
         SJGQ==
X-Gm-Message-State: AFq9FYL4BrGqr259dRkFZbzvpfHAbjkZWWQSLZAMjHyzX7EmlQvRPZQQ
	/UuUXu+KISFogl+ViPFqG0OUaRuQ3CAZLolW1sfLbd0UTR1Yg4Ee8Zq0OtKKuSbl8FVBew==
X-Gm-Gg: AYBFou2WqNoEYaSov2KCzdwGlHVi9iHBr/ro+1PdpEHF0aooW57yNWiWzD0ZlpzaHtH
	2yD4AZvWUeYzQOLmrAZce48KoJis9KcR/FhQJrdJCjEAMEV3msNDBJMz7BQ/llaxZJvg5vj0PLV
	itVD2U7kdbMMa/UprActGAELQCegdkO06BbBEU0X0cwKtOI8bCF2eUVplx5DzM1psTiFn8eGjYn
	jOS0Q5gppUp5UDNl4RSOl4NRRlCwQWdbp6f8foTNMzxlBpsX/rc3W549qfnvDztzhai3kZL4fa+
	FwRQuK2DzyHai2leNali0h2Rxe4fP68vBc8AW4rtmwFXJAZfx4Sgvz94UG5RDJz8KAXy9satBji
	5LimIJ/FWX6dWTD+egYBubgYdLeqmZh7W0KvO4hQGEBggsxCB/Gf5MAMfXnQWOYdXGsx0NVEEth
	b+3fM2aTngmRLW5L81ccv28+/N67CZvyEql7iuz97JH4h3qJ9KzfBxpAViV2ZW0SVEJjzVM4Tfw
	5UqAwX4jUA06NWzNDsuJHEhGzyhor8QBSCPh0olJB02J3QRvo4ZiPP9XJ74vc73NbvdDVdFw+8r
	5OU=
X-Received: by 2002:a05:600c:6612:b0:4a8:c6a0:c08f with SMTP id 5b1f17b1804b1-4a8c6a0c4bemr5634875e9.35.1793096837300;
        Tue, 27 Oct 2026 03:27:17 -0700 (PDT)
Received: from fedora.home ([2a01:110f:1ce1:e800:f148:be2f:d25d:95a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm255806045e9.12.2026.10.27.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:27:16 -0700 (PDT)
From: Vladimir Gorsunov <gorsunov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Vladimir Gorsunov <gorsunov@gmail.com>
Subject: [PATCH] scripts/tags.sh: fix Kconfig indexing when using etags from emacs package
Date: Tue, 27 Oct 2026 11:25:42 +0100
Message-ID: <20261027102543.22151-1-gorsunov@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'+' and '?' operators in regular expressions are handled differently
in Universal/Exuberant ctags and emacs. In emacs, + and ? are
operators, and \+ and \? are literals. In Universal, it's the
reverse

Replace \+ with an interval the same way \? is handled already

Signed-off-by: Vladimir Gorsunov <gorsunov@gmail.com>
---

 Hello, my first attempt to contribute something here. If anyone
 could test, you need Emacs >= 31.0, because character classes
 (:alnum: etc.) did not work in etags since 27.0 due to a bug

 scripts/tags.sh | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 41e38df96984..ce2fa0ef5910 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -162,6 +162,7 @@ dogtags()
 # the following limitations:
 # - No regex modifiers
 # - Use \{0,1\} instead of \?, because etags expects an unescaped ?
+# - Use \{1,\} instead of \+, because etags expects an unescaped +
 # - \s is not working with etags, use a space or [ \t]
 # - \w works, but does not match underscores in etags
 # - etags regular expressions have to match at the start of a line;
@@ -212,8 +213,8 @@ regex_c=(
 	'/\<DEFINE_\(RT_MUTEX\|MUTEX\|SEMAPHORE\|SPINLOCK\)([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_\(RAW_SPINLOCK\|RWLOCK\|SEQLOCK\)([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_TIMER(\([^,)]*\),/\1/'
-	'/\<DECLARE_\(RWSEM\|COMPLETION\)([[:space:]]*\([[:alnum:]_]\+\)/\2/v/'
-	'/\<DECLARE_BITMAP([[:space:]]*\([[:alnum:]_]\+\)/\1/v/'
+	'/\<DECLARE_\(RWSEM\|COMPLETION\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\2/v/'
+	'/\<DECLARE_BITMAP([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/v/'
 	'/\(^\|\s\)\(\|L\|H\)LIST_HEAD([[:space:]]*\([[:alnum:]_]*\)/\3/v/'
 	'/\(^\|\s\)RADIX_TREE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_PER_CPU([^,]*,[[:space:]]*\([[:alnum:]_]*\)/\1/v/'
@@ -223,31 +224,31 @@ regex_c=(
 	'/\(^\s\)OFFSET([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\(^\s\)DEFINE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<\(DEFINE\|DECLARE\)_HASHTABLE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
-	'/\<DEFINE_ID\(R\|A\)([[:space:]]*\([[:alnum:]_]\+\)/\2/'
-	'/\<DEFINE_WD_CLASS([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<ATOMIC_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<RAW_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<DECLARE_FAULT_ATTR([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<BLOCKING_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<DEVICE_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\+\)/dev_attr_\2/'
-	'/\<DRIVER_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\+\)/driver_attr_\2/'
-	'/\<\(DEFINE\|DECLARE\)_STATIC_KEY_\(TRUE\|FALSE\)\(\|_RO\)([[:space:]]*\([[:alnum:]_]\+\)/\4/'
+	'/\<DEFINE_ID\(R\|A\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\2/'
+	'/\<DEFINE_WD_CLASS([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<ATOMIC_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<RAW_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<DECLARE_FAULT_ATTR([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<BLOCKING_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<DEVICE_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/dev_attr_\2/'
+	'/\<DRIVER_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/driver_attr_\2/'
+	'/\<\(DEFINE\|DECLARE\)_STATIC_KEY_\(TRUE\|FALSE\)\(\|_RO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\4/'
 	'/^SEQCOUNT_LOCKTYPE(\([^,]*\),[[:space:]]*\([^,]*\),[^)]*)/seqcount_\2_t/'
 	'/^SEQCOUNT_LOCKTYPE(\([^,]*\),[[:space:]]*\([^,]*\),[^)]*)/seqcount_\2_init/'
-	'/^\<DECLARE_IDTENTRY[[:alnum:]_]*([^,)]*,[[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/^\<DEFINE_IDTENTRY[[:alnum:]_]*([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/^\<DEFINE_FREE(\([[:alnum:]_]\+\)/cleanup_\1/'
-	'/^\<DEFINE_CLASS(\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<EXTEND_CLASS(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
-	'/^\<DEFINE_GUARD(\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<DEFINE_GUARD_COND(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
-	'/^\<DEFINE_LOCK_GUARD_[[:digit:]](\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<DEFINE_LOCK_GUARD_[[:digit:]]_COND(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
+	'/^\<DECLARE_IDTENTRY[[:alnum:]_]*([^,)]*,[[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/^\<DEFINE_IDTENTRY[[:alnum:]_]*([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/^\<DEFINE_FREE(\([[:alnum:]_]\{1,\}\)/cleanup_\1/'
+	'/^\<DEFINE_CLASS(\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<EXTEND_CLASS(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
+	'/^\<DEFINE_GUARD(\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<DEFINE_GUARD_COND(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
+	'/^\<DEFINE_LOCK_GUARD_[[:digit:]](\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<DEFINE_LOCK_GUARD_[[:digit:]]_COND(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
 	'/^context_lock_struct(\([^,)]*\)[^)]*)/struct \1/'
 )
 regex_kconfig=(
-	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/\2/'
-	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/CONFIG_\2/'
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\{1,\}\([[:alnum:]_]\{1,\}\)/\2/'
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\{1,\}\([[:alnum:]_]\{1,\}\)/CONFIG_\2/'
 )
 setup_regex()
 {

base-commit: 83deedcf85af511dc120b3cd8ee597d211cdf2fb
-- 
2.56.0

