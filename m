Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978214;
	b=wrf0SDTHX4p9Z9MNv9ubAzz/jLY+B3V7pqBmnAV1POoSNOjgcqcvhx0/E0DN9XlUo+fa
	 DsXCkVVOdjoVXEJoQcaPPLudbohkiHcF+hjTlIXQuBCOys0wNcnLel84T2JGab3AZpOU7
	 0ubYstTNSON9StqY1GYZ5WEPpoxdE7vs96DFhkh/iJEqFBXMt7Qi9JLq0a1Dtfmm4C7dX
	 LhHqkfsDWDNJWJJ/vbBWfRF/MdZmDLAavxXHEvJsvRWY5oggGpZhGBcY5jCO/t4jZC0bd
	 XTNlW/xiY6/p8uhBEEDErA0bq9k+plRmHMLPTLyVzhyOpZDKnrdrZIsomBBvdelU2gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
	b=2fb/xpRHx9a/vCJ8MxLariesb/e69072VLzlv0GIVkiSLagytiyV/8PFCNLdmTE7Pf1w
	 LFm1wxKiQTbxvxaLugBUqxorIepl0bAIK21ZhoxLIUlha8CvVgxb8fPJcmNFTk88dqvAI
	 WWPzLDBTF1ZFwxszRT8s3o+v1Rc050k9xnSquHDDbpBKULpHK6OBji0VyNJ5pJGJsmdgg
	 0yMrvR4TicjQiknFxOBrNbBeH+vSYwJNYZCiVZCzLSK7Tlq5gqAMukGlk0I+gDRRWIG3g
	 mzgmt3SdKniTQ0pyveq9/usXaF5sS9VmB9adqAiznYnChrFN8uz4Oi4Ut+Pm1h7oiCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3A606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A3A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9bef55so32917741cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978213; x=1793583013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=bN4CDDSItCtt/QdxJizZA1Za1opqZMedq/YPSVbx9jVRAv+IQ7BFhAlMW/7NWv7ESx
         FOoNXzrrhQ70rmZRcW0No3Ylb+06pJxeoqOtFVFIorI404RFF6MVzF3J07lZ+JXWLnu0
         1OogcxTj5x5ZvERUql8WIiWWtEvKJpNIRWrukVprl/HOa0/eQaodZXXR4TIWJznoPfGz
         WavttMySLc0Eu8wWcw7mvnRfL0vkXcISSk+dgoaOGTsyaoI5HbC6Hj4RuSz3JG9/T1kI
         gg+c7bDGE/WyczdoMvnqKbAXOTkO88ZjMyMyz77+GcBMs/G4//5VjKd/6u7OZDW5awkn
         5SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978213; x=1793583013;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=v1IhthAzkM9W5AGv6+SXN6Mf5Ko4OOwiqJUbvDCWBdP2yjMHKSjdvfsH/TmEq8Ssjs
         lYoupnQ+36BTxxYiq3FZVSjqQt0W+aq/zjVadT0l5uRsq8kWCvLI89UaLP2Sg1w00Q0i
         5G3Fe/ZXLRvQaj3nJiVNWqfc5hlLgPouoHE9OL5y/bUxkp85rDdljQv5kncBypWRAPgt
         a5HUGNQVy4Cck0VbhpiarjFbGDGytZefDlDr2ChB4SFWWjrVeNMFpnLA+rnVx4+6IEID
         RfR7r+9XdouxbdnoMxvwuuPEiMxx0cviCK5CuRSDdvIQtr3t0XJO++bWQmTasnPyJoo8
         Q/tg==
X-Forwarded-Encrypted: i=1; AKwUvBxWg3HANxiv/4E+W1rqieC3q5Sl/gU/qZGNsrDMd1ISx+Rbb38BHYxKGlmvrHctDjuBKDpz3vkDZgfiP4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1oAa1hSBOvFO1VtiTTaRi+AWY4vBttmzFuBYAosqk4/h7t7A4
	rh5i/L/kB6koOzOQWymyvBS1NE3E1hvjsjNXQ9TiPHl01WH30ZlL9Pw=
X-Gm-Gg: AYBFou0jfXwIVeTdQ43dafd+SC5ylHxEMfWR0eAk2z41bJkHIEOonjaKig/e70ecn3Q
	Y+5Xqwpdm+VEw5rCumfvBJyEVQc6NLvq2ZnlSnpf5lxsoTLy5T9pBroSaFu4QwkPdlxgRbjlFH9
	swDtOyCJEhViduHSOcUY6M/hMuFIInzYZdbl+f/zZnK+W3Ct6blbrKdUPjsbdKal/WAy6HbxETH
	xoQGRiMW1LutCdNAODtakns+t4dSoGFEx1SPXq61qMdyxmLqYCWJgh0tnLiA5qxvX2t76NKmofu
	BAWRa9TaKXRX42O/MmnwaoJmVWmmUf73YkHZ8uChq9mzkhbTe4yf19MWZ4pnOLm7eoA90Tp0lCn
	6RNQ/unTUtY1GwJiPLp0l4R0cM0pKnqWhwwRQ+cp1Cyp4+ER9NiQ6+NJgD/tnw4gnhN79LS0VNi
	VwCZie9WtWsNQ5+h1Y4cgqQzo06PHR3/8HuNkdDV09hn18tHeummS9PNSMrnRuf6M+3+TV1qHHQ
	4Ic2RfRXLswXTfyP2UNAZ8wzTYdNyDG7aCHNsi+jGo8fCOs8PxMw32o66nJ21EaCiZ50y6iLrIP
	+VsY32lEbFZ8qFM7YleGB7xo+KTe4SJelozs6hofGN9d9WuzOEYKAMJ+AoLBWqBUTrBxNA0khT8
	ru/+a2COC2+cieZLf6yuy
X-Received: by 2002:ac8:5d8d:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-5383ba8566dmr80965731cf.14.1792978213302;
        Sun, 25 Oct 2026 18:30:13 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:10 -0700 (PDT)
In-Reply-To: 
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Subject: [PATCH v2] Documentation: kunit: document --summary and --failed
 options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179297820302.2598507.5712076951623488183@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


