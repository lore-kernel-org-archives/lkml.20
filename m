Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97DF48A2CE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782847; cv=none; b=QSCqrulZK2MNy8c9gWqE6jKqH+iJ1vfWFz3Bs12svtBwsDgM7P14DG9zOHNYBO5c87xOYqI7NXyvhH6iqnbQDYMOC6KfaeFNz8KTeYWWuMOFicFNBRp0bmwcQ1y+C7M5h/iefbxjDnA6YJWhMtENumXTQMb+XtFs1nVp+AcL8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782847; c=relaxed/simple;
	bh=P7CaDYp4Md1JqTyutqJPlck3ggTW3k80tlDn2jcOYR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bC/01DlwbfcvYgpnge/cXETT0+QUZn924y26sjKDSC35OgnawzV+GXW0J13vXq9NfJ9UCsQINTZP5/EtaIFrwsJnBvyBcypLBSbcWEEp4E5fmly6iLr1ViN6aJW3YU1p1SXRX9vxGAF/EOtefokl1nKFE4yAxxrWvsm1tFizFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yuc1wh8Z; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yuc1wh8Z"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1b233ca98so2586669eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782843; x=1789387643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdcXJNy9L8Tsu/vg5VhZVH08lUj+s69BRMYHBDv7fJk=;
        b=Yuc1wh8Z2allQOLB1X+Fx8FWuKZ9jaW8Lh7xou61YWzz3lO+uabc6Fl9TG83LeKekz
         6+MNdBUVZSggZBpYunxV33ysEZNSbfBd9m8WdOtkxQu5PeMT/9GgOjg3gI2ZE5sCuJOD
         mgzoQMwSttI9X7DE6LeCICS1aEJh+9jxajwxhzalbCwbJ0ldoDads6KxxuYrsqcxG8jJ
         Cpay2A6v1eDJhteL7+3nk3JTd0VkGEyylaC6iRkJv4HQ/nxxRQPLhb0wHYnOcYyXsWc6
         kEk5P1Rd6r/XKorsx4LxLoH1NIJR2ufvsAOWwVhTi6vNa/TfVQF4bq54wdId70MMjlrg
         6BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782843; x=1789387643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdcXJNy9L8Tsu/vg5VhZVH08lUj+s69BRMYHBDv7fJk=;
        b=Ez3SJ8dBlvpezUOedO6NnEatH6oCg9IrGL3WxQcvNMq+cHq6oCuprf30e/CBw2ROKi
         SJ3FijcX+VpEIAWXktBT6TgIw87o/sVHB9jWHL4k/71P+k5M/AOw1tY7glCrFbqDFdnC
         cbYCHa0XiI3Nd7h/w3oGjxVQ9+hhW4o7PIBHPXluFjjZpRHPeTic0d5hpyxaEDFTkxS/
         qCc54ZW4oPhozSQuFU6MAIlj0YvHptsrbx30bLTwKr34T86mpCifbTNb/2dD3/JQhYRs
         p2q02vZlOVkfFuxYnDBwyILipg+HJ9LndgFufYEhrChhxM4vTPGEluJZs8BjI6LtaJ+V
         AmYA==
X-Forwarded-Encrypted: i=1; AKwUvByo3uAyeJTQI9UUaesQxmS91sVKLGK24fzhOGfArXbdRmjpZPiEBLuz8Q4dOKaqojt0hF3rdj523rQ0njQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUSNCoY7x8kxOhLOVGNf0TiYFWSoWTVtQt3fdx8SCD3LShl67i
	QV66J7leG3xD/wYd2C155j/dr5ZnEjIt996sCVoPoQpHHdICoOjELVCD
X-Gm-Gg: AYBFou3ero/53uNtU6GpS00msCd2IdCkeE7TjKCWfFOH7bn1KpNOu0rD9bWYsh1npS7
	o5P7Qzl3VvDJ++CUGsCieiubYEu7Qp/CXnLZCTPZ6qXRousarBT6015bUoXzN1xKuRFFA8XE1Gc
	Q2xm8o9dXU1y7ga7uxrIBYDZa9Sq64/vDHULlmOhSJ/ovXoxh7L5gI3krdevYJWAP0UjYmt3Iz6
	kTFZW62nmyhG5fl5TDg00ZUMJbBy+3CpqMdX4eKcp/9rtp+q0lWPaK1G7L0qosRKjLfRB9SatQf
	M8crTMJu/La07HBMIK3uUp6LCTgpmF4DJt3PJ/TZvi3YDlqTY8b896Myrt2jYL4eUuPTcFZX7XX
	etL1okByXvRItg/vR8yAUvycQggQpfSlVkg77VbPjFh8NSPATfla5vuwK9dVth5yiSDNLolTtgl
	VAsBUsU82EPcmrch1GdT3qXEm95TGN+HAzvHc7d6P0PKhJHhRqEc39rYt/EZWA83RiZ/IXAefbf
	4vQoTba0YAwQlg7meZhoKL4
X-Received: by 2002:a05:6820:6ae7:b0:6b9:3295:7704 with SMTP id 006d021491bc7-6b9329579e2mr5576998eaf.52.1788782843391;
        Mon, 07 Sep 2026 05:07:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm23658592eec.11.2026.09.07.05.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:07:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Thomas Renninger <trenn@suse.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	"John B. Wyatt IV" <jwyatt@redhat.com>,
	John Kacur <jkacur@redhat.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] cpupower: monitor: Show how a counter value is exported
Date: Mon,  7 Sep 2026 17:37:17 +0530
Message-ID: <20260907120717.35503-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"cpupower monitor -l" lists the name, the processor hierarchy level and
a description of every counter, but not how its value is exported. Some
counters are a percentage of the time spent in a state, others are
absolute values with their own unit, for example the Mperf "Freq"
counter reports MHz and the RAPL zones report micro Joule. Both cannot
be told apart from the listing.

Show the value type behind the hierarchy level and document it:

  [%]   The counter is a percentage of the time spent in the state.
  [abs] The counter is an absolute value, its unit depends on the
        counter, MHz for "Freq" or micro Joule for a RAPL zone.

Before:

  $ cpupower monitor -l
  Monitor "Mperf" (3 states) - Might overflow after 922000000 s
  C0	[T] -> Processor Core not idle
  Cx	[T] -> Processor Core in an idle state
  Freq	[T] -> Average Frequency (including boost) in MHz

After:

  $ cpupower monitor -l
  Monitor "Mperf" (3 states) - Might overflow after 922000000 s
  C0	[T] [%] -> Processor Core not idle
  Cx	[T] [%] -> Processor Core in an idle state
  Freq	[T] [abs] -> Average Frequency (including boost) in MHz

The check mirrors the one print_results() already makes when it decides
how to read a counter, so no new helper is needed.

The time granularity part of the ToDo needs a new cstate_t member every
monitor has to fill in, keep it noted.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    Changes since v1:
     - drop the value_abbr() helper and check s.get_count_percent inline at
       the printf, as Shuah Khan asked; it matches what print_results()
       already does a few lines above

 tools/power/cpupower/man/cpupower-monitor.1              | 8 ++++++++
 .../power/cpupower/utils/idle_monitor/cpupower-monitor.c | 9 ++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/power/cpupower/man/cpupower-monitor.1 b/tools/power/cpupower/man/cpupower-monitor.1
index 89af019f8dc4..c8008919627c 100644
--- a/tools/power/cpupower/man/cpupower-monitor.1
+++ b/tools/power/cpupower/man/cpupower-monitor.1
@@ -51,6 +51,14 @@ coverage in square brackets:
 .IP \(bu
 [M] \-> Machine/Platform wide counter
 .RE
+.IP \(bu
+How the counter is exported, in square brackets behind the hierarchy level:
+.RS 4
+.IP \(bu
+[%] \-> Percentage of the time spent in the state
+.IP \(bu
+[abs] \-> Absolute value, the unit depends on the counter
+.RE
 .RE
 .RE
 .PP
diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index e8b3841d5c0f..df00e82eb820 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -284,10 +284,13 @@ void list_monitors(void)
 		for (state = 0; state < monitors[mon]->hw_states_num; state++) {
 			s = monitors[mon]->hw_states[state];
 			/*
-			 * ToDo show more state capabilities:
-			 * percent, time (granlarity)
+			 * ToDo show the time granularity of a counter, this
+			 * needs a new cstate_t member every monitor has to
+			 * fill in.
 			 */
-			printf("%s\t[%c] -> %s\n", s.name, range_abbr[s.range],
+			printf("%s\t[%c] [%s] -> %s\n", s.name,
+			       range_abbr[s.range],
+			       s.get_count_percent ? "%" : "abs",
 			       gettext(s.desc));
 		}
 	}
-- 
2.48.1

