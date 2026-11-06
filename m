Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964711;
	b=yRMwQjIzBPLuxDNzL7Jb0Bt1dCtg3MCiq/jkftbVAnf7j3WNMK8D9Y8CcdTi9V6CHAbT
	 nZtNyP/2OFANCe1aelch8PDQo5J23dIPTnTWQWG8D2LVvS2zm1v9If+X1E7X+hAih9tGL
	 GCdsgX4JewMDrvcp3TaQc41J3eRJ5yphpv+6N66JotpYJQrEVNWEzXaD7WrDT4SURn0oy
	 73Y/7TkKd8zP/X+iqARxWx5junVsLC/igePKJpPpsEOsVZeYOHDo4nbPEkKlIeXrZkxXR
	 2O5DQ3P6CFDF9/gEWUw+9UmYfHD0DWFcL/LYS5I34tL2PuSpVoxip0IOHjeUBBTjS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
	b=WmYkYHT3dgIJCCohnC4sVfh9zS/nW0o6Y89zVLGStFadwC3noGktu2TVB7dHKtOw4+Im
	 T+waD31GKFvD1qOFcJinLe9d9AeuypjK1z7xjLpec+M+POaeUwXPe8k/f4O0cd3FFslyS
	 dXVp+tmH4KZGtYgFJvmygV0LvRcHuBMwRkUQJSNMVBD+EYYlCVt8qzchs4y8wKmWlhKfz
	 Cv/xJv4mSdCUdGzO0wZsUsMUcfzIR2L0P6i50//7GK9am+doNDcCeRXodKX3ZtgwkxCAy
	 AVROwWImeh/4D/mlr7fuq5dVPmti8EslHkW1u87g4SFnTWbu/jXZp+rwoCxn6HHmxXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEt55960;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B821F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEt55960
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so35064a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964710; x=1794569510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
        b=VEt55960C6+bosFlCaBbLOI7dtjFkFGX5gLOLAST7jc7/yJmZeAlUgl7J6uwy/RSK9
         Xm676Arw7uPQAqfnBG7FCePWEJQhu10WsEMRIhwINeL1bDTHp/innmOkxbpgzG/DXU81
         5fGUWzOhVm4RlU6l7Woei/9ntCMJsbn7O6cT3F7EFiXodurL9HzFlVpR2MkWvGBO8iRS
         sOlyLjx5Mh8ykyVAAB2nC8OqhJ9FXCwj3+NidIT33vU6oWhmDhjws+DYnmcn8JfklHv+
         RAlIhUMeupt90jttFQsu3yHqvkqB8TMtQZTDcKIfrDP+G/AQtlL7DjM12msXfL/zdZ5r
         dR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964710; x=1794569510;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOrvEN+KVCGlTSI7YSpq2m2C7VkxLE0ZfmB8g9JVNC8=;
        b=SY87rCq0g8qefPdqaM84/W27KDWEtctLM2s1SKm9uqpNqnu79hpzesnzBbgTe9aU0y
         T8k6+/uRZCFuj6urS7a9VoQNrRT1grTi1IdGeUx5+ki2gHAZBPumsG/jPXMrKPtsZqic
         P/tItUsjYK11hshmSMLqHkQBjRQzsbm4v2wZOzmm7beDKVWt7EedmQ+lkii8ge0v9sQU
         EJ+pMgu0agkGPTeFLUS2yUuqftN+j9TzVp1n9RxzlfB/GwMFz5orJ9a9vb/fq728/Bno
         AkZpnCDY2l7QxO1Udp5I1aFH2q06fJYMc2XKLpN9XtSmD4iazGpOe8MBdmYVjl3hHE9T
         DrCA==
X-Forwarded-Encrypted: i=1; AL+hErH20wvsIZieP42LWdg+CCNvj5FPsgmDd9Y0xrmKgAv6tklo03LKaQvcsjEqupi5FwnzLV0jol/1hthOrv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MvCAfz4q31YQENEze4lloJiNCNOvM1BRrbhdMW1cbcct95pnu
	J0Ik3WovbBuwV0vkg8gz0lesn50WIrEem5dv/n2p9o4VPmAMjh9CVGeA
X-Gm-Gg: AYBFou2xIrT6F3P7RmR+sJVEJZMyGSIz0XBRU5GmEDsJTILrBWVf4hl0rhDzRvxwlYM
	FovDuX8gqFKzP5j22ngA63AkYmYkAluDmpBYTWOHIxT2ahd4uoTglW1gYrL+UkI3wRs7qH5+A23
	uwQ6w76YSU46mV5cPCBU/Z7NHeR9I9AswvnJNswxIXZDTlqrEK0qIIh/+96gnKvN0HjlPRVOEVH
	GWxWH9ms/uBT2ruWe46gtatq8j3AKBOxXbZEOZTzT6AUNq5naqwAZgtqc/ZB9qYahBWsVfL1UA7
	Eup1AYMkEkypkOVSE7aDm5SsaFrzDwJLcS255bKMe55Ehf8klmXfUETZGRO4hsY4Y/K+UVU40/C
	iVw9UPKTu7gTd2ZpvB3f9i3ONQ68E7aB+BeyLzv1M4yEbt6wKneofdwRgb9rA2HUbWLW9l2Ctd+
	ctmhecQVSYDV5Y/sD3I0hU6bfm1dQ3VhlWx/7tSQNEDWOY4g+BYXYQfuyTQzDiOP4uLf38gL+5S
	ylpBSlZwmifR1tw/ISTknOQ5c69n2Q2ulf1dx6mtvd2l01YIAGFiNO2A0lPES+0LnRN2eg6GHRg
	d3F5pm7XnBILZLdYP+183PCnCqvw1ZXU0qTA6b0UvBwzKnxK696vkuV8G0glh9UN0DGUW+8sk3h
	UAPRmMPAbzqnY9StnncL/C+dF
X-Received: by 2002:a17:90b:1c87:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b0db6cdd38mr3241251a91.4.1793964710071;
        Fri, 06 Nov 2026 03:31:50 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:49 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 00/25] docs/zh_TW: process: resync translations with the English originals
Date: Fri,  6 Nov 2026 19:31:15 +0800
Message-ID: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series brings 25 of the zh_TW process/ translations back in line
with their current English originals.

The "update to commit" markers in these files cannot be trusted.  While
preparing the earlier process/ terminology series I found translations
whose marker named a recent commit while the text still followed a much
older revision, so every English change in between had never been
translated.  checktransupdate.py takes the marker at its word and cannot
catch this.  Each file was therefore compared section by section against
the full current English text, not just the diff since the marker.  Each
commit message lists what was added or removed, and the marker is reset
to the latest substantive English commit.

Mistranslations found along the way are fixed in the same patch, and
leftover mainland Chinese terms in the touched text are localized.

Not in this series, to keep these diffs reviewable:

 - Whole-file terminology unification (e.g. 補丁 -> 修補程式,
   許可證 -> 授權條款, quotation marks -> 「」) together with an update
   of glossary.rst.  This will follow as a separate series, so some
   files still mix old and new terms for now.
 - programming-language.rst, whose current marker points at a merge
   commit; it will be resynced after 7.4-rc1.

checkpatch reports "Unrecognized email address" for some lines in
2.Process.rst and submitting-patches.rst.  These lines describe tags
such as Cc: and Acked-by: and trigger the same warnings in the English
originals.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Chen-Yu Yeh (25):
  docs/zh_TW: process: sync 1.Intro.rst with the English original
  docs/zh_TW: process: sync 2.Process.rst with the English original
  docs/zh_TW: process: sync 4.Coding.rst with the English original
  docs/zh_TW: process: sync 5.Posting.rst with the English original
  docs/zh_TW: process: sync 6.Followthrough.rst with the English
    original
  docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English
    original
  docs/zh_TW: process: sync 8.Conclusion.rst with the English original
  docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the
    English original
  docs/zh_TW: process: sync code-of-conduct.rst with the English
    original
  docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English
    original
  docs/zh_TW: process: sync development-process.rst with the English
    original
  docs/zh_TW: process: sync email-clients.rst with the English original
  docs/zh_TW: process: sync kernel-driver-statement.rst with the English
    original
  docs/zh_TW: process: sync kernel-enforcement-statement.rst with the
    English original
  docs/zh_TW: process: sync management-style.rst with the English
    original
  docs/zh_TW: process: sync security-bugs.rst with the English original
  docs/zh_TW: process: sync volatile-considered-harmful.rst with the
    English original
  docs/zh_TW: process: sync 3.Early-stage.rst with the English original
  docs/zh_TW: process: sync coding-style.rst with the English original
  docs/zh_TW: process: sync embargoed-hardware-issues.rst with the
    English original
  docs/zh_TW: process: sync howto.rst with the English original
  docs/zh_TW: process: sync license-rules.rst with the English original
  docs/zh_TW: process: sync stable-api-nonsense.rst with the English
    original
  docs/zh_TW: process: sync submit-checklist.rst with the English
    original
  docs/zh_TW: process: sync submitting-patches.rst with the English
    original

 .../translations/zh_TW/process/1.Intro.rst    |  16 +-
 .../translations/zh_TW/process/2.Process.rst  | 176 ++++----
 .../zh_TW/process/3.Early-stage.rst           | 192 ++++----
 .../translations/zh_TW/process/4.Coding.rst   | 414 +++++++++---------
 .../translations/zh_TW/process/5.Posting.rst  | 141 +++---
 .../zh_TW/process/6.Followthrough.rst         | 247 ++++++-----
 .../zh_TW/process/7.AdvancedTopics.rst        |  53 ++-
 .../zh_TW/process/8.Conclusion.rst            |  27 +-
 .../code-of-conduct-interpretation.rst        |  16 +-
 .../zh_TW/process/code-of-conduct.rst         |  54 +--
 .../zh_TW/process/coding-style.rst            | 286 +++++++-----
 .../debugging/gdb-kernel-debugging.rst        | 104 +++--
 .../zh_TW/process/development-process.rst     |  12 +-
 .../zh_TW/process/email-clients.rst           |  78 ++--
 .../process/embargoed-hardware-issues.rst     |  51 +--
 .../translations/zh_TW/process/howto.rst      | 182 ++++----
 .../zh_TW/process/kernel-driver-statement.rst |  24 +-
 .../process/kernel-enforcement-statement.rst  |  59 +--
 .../zh_TW/process/license-rules.rst           |  86 +++-
 .../zh_TW/process/management-style.rst        | 294 +++++++------
 .../zh_TW/process/security-bugs.rst           | 296 +++++++++++--
 .../zh_TW/process/stable-api-nonsense.rst     | 243 +++++-----
 .../zh_TW/process/submit-checklist.rst        | 159 ++++---
 .../zh_TW/process/submitting-patches.rst      | 338 ++++++++------
 .../process/volatile-considered-harmful.rst   | 115 ++---
 25 files changed, 2109 insertions(+), 1554 deletions(-)

-- 
2.43.0

