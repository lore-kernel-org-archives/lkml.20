Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17C3FF8BA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228295; cv=none; b=BwQTkcrLRrGKrKV8pEwC0AwiU5L6YRzCC2sZc3NUK5y2jQVfTMA2cHZZ5hRUqOIjoWZjYHbquO+yNMTFKkJEPjcDIPZmqIaYwGpBSdNuQjwaiwJRDTd2flwToYl5orhttT5ODC6AmPeExKyxIsclOw7mLQWF17ewewCgOpr8FZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228295; c=relaxed/simple;
	bh=mgHqw0aMH+6HR0CqOm7nIPLPhQH4ceBfWunzC+lJCvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pqAC19sdQ0LYfFVNRKONscP+jD4wV18GuQlTszUPt+ZPpVsSHmicUfRXoxW1EeE8AsyPsKtUaZnWMQlv22NmA2UnD9RXEuapPH0r2j0kfZ3OcX6HzaVFWrB6pgcePSKY66cz5/H9PweMaQVken5KCfFyFBRPE6i6IkIlmbjgoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5GLsKjY; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5GLsKjY"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2296768c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790228289; x=1790833089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6NWUI6GW15IkHXpICDpWmf5urD4XS2/MCUoQqseXnA=;
        b=T5GLsKjYmc5Ja32KDLpHStpCUgElCfQYN0Tgh+uiKAftgnkF7lsdwrWCdg2STyocLg
         ntS7S3me2GHZoZBU0L2vUCILKS1gv/IgyoI58Iys6zzVnu/RxWxKMM1wFHgiiw95Gxq3
         WNwPPMTZ85nGkN9Ik5JEfsfWPhzpfztmwXnGfJHtPSf2Fs60JELpdqzm5lqYwGOJ2l/T
         zD0GXPyQIMuPwl4/LgTukUGZ8mUaSer1PC080M/3JZhB6iSVTs2a8R+leIKvi+tIU4Rh
         KDcI4WNHJl+i8DUWhCGrjBSWvl8kIit4FHzy9HOr3cj/+fW1nF682Wp8rtfOHyERFcbx
         KSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228289; x=1790833089;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6NWUI6GW15IkHXpICDpWmf5urD4XS2/MCUoQqseXnA=;
        b=AEpSypEVAwybUAfD5mPcYYAFDfi9QFcA2AJi5nNak8OkX1QhKYPURyMPue8g331cjp
         VkpMPYevrE+UbyaRIZk6LdiK8T76WG5OT4W7QfJ1FmlX5GLaHZV/9Jj86rtkbH1ibj7v
         Zo6VqpnoK4gRNEpY4ZL30rApas4OzAv4vYJNclh6q4MLvF18Bj0O+MO/CSBbYO9yLsd8
         5EksJan0hQ9ykEoy9lLWVIO7M+4tYsp2jlRwC0CrzZapRxtbVEdnRFe6ypHgTrEW6LSj
         Ch9fYK78cVHV+F58QJEOx0RHgoKSNhTAqkZ8kUUSM8kFBvMvpmIW8f1p4SkMkT25VL0f
         DHIA==
X-Forwarded-Encrypted: i=1; AKwUvBy/HmnTOXJZQy4LXEkUrIVmnlWyRKNSKpsv39M+bPieeiM2/aUbPFmgBJvLXxw+k33ClwQv2VLrfkwlGzM=@vger.kernel.org
X-Gm-Message-State: AFuF++m/IsCigAzPLePIynZFhgHuUmpWSy647VzCW9j8OQT8DF1wIUHC
	BwL9sSkE6rtqWwoX0KxrXWrPGaJyIL77JP19eqOuhoa0Bo0E5bkf4E3lXExh/uIGiv4yDvGq0S1
	ULi/TOnDhWg==
X-Received: from dlbek22.prod.google.com ([2002:a05:7022:c96:b0:144:bebe:a64])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4186:10b0:143:5c63:23bb
 with SMTP id a92af1059eb24-14503fd2aabmr1093019c88.11.1790228288745; Wed, 23
 Sep 2026 22:38:08 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:36:30 -0700
In-Reply-To: <20260924053645.3555041-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924053645.3555041-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924053645.3555041-7-irogers@google.com>
Subject: [PATCH v1 06/21] perf vendor events intel: Update emeraldrapids
 events from 1.24 to 1.25
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Chun-Tse Shao <ctshao@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The updated events were published in:

  https://github.com/intel/perfmon/commit/0929815a4859319c27d2aa9099d394408=
29c5d7a

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/emeraldrapids/cache.json         |  2 +-
 .../arch/x86/emeraldrapids/memory.json        | 35 ++++++++++++
 .../arch/x86/emeraldrapids/other.json         |  9 ++++
 .../arch/x86/emeraldrapids/pipeline.json      | 10 ++--
 .../arch/x86/emeraldrapids/uncore-io.json     | 53 ++++++++++++++++++-
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 6 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json b/tool=
s/perf/pmu-events/arch/x86/emeraldrapids/cache.json
index a44e1f027c1d..fc1be5b2bff2 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/cache.json
@@ -1201,7 +1201,7 @@
         "EventCode": "0x2c",
         "EventName": "SQ_MISC.BUS_LOCK",
         "PublicDescription": "Counts the more expensive bus lock needed to=
 enforce cache coherency for certain memory accesses that need to be done a=
tomically.  Can be created by issuing an atomic instruction (via the LOCK p=
refix) which causes a cache line split or accesses uncacheable memory.",
-        "SampleAfterValue": "100003",
+        "SampleAfterValue": "503",
         "UMask": "0x10"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/memory.json b/too=
ls/perf/pmu-events/arch/x86/emeraldrapids/memory.json
index 5e6c1f05c981..93effd1d69a2 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/memory.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/memory.json
@@ -55,6 +55,17 @@
         "SampleAfterValue": "1000003",
         "UMask": "0x9"
     },
+    {
+        "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than any number of cycles."=
,
+        "Counter": "1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY",
+        "MSRIndex": "0x3F6",
+        "PublicDescription": "Counts randomly selected loads when the late=
ncy from first dispatch to completion is greater than any number of cycles.=
 Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
     {
         "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 1024 cycles.",
         "Counter": "1,2,3,4,5,6,7",
@@ -91,6 +102,30 @@
         "SampleAfterValue": "20011",
         "UMask": "0x1"
     },
+    {
+        "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 2 cycles.",
+        "Counter": "1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_2",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x2",
+        "PublicDescription": "Counts randomly selected loads when the late=
ncy from first dispatch to completion is greater than 2 cycles. Reported la=
tency may be longer than just the memory latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 2048 cycles.",
+        "Counter": "1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_2048",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x800",
+        "PublicDescription": "Counts randomly selected loads when the late=
ncy from first dispatch to completion is greater than 2048 cycles.  Reporte=
d latency may be longer than just the memory latency.",
+        "SampleAfterValue": "23",
+        "UMask": "0x1"
+    },
     {
         "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 256 cycles.",
         "Counter": "1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/other.json b/tool=
s/perf/pmu-events/arch/x86/emeraldrapids/other.json
index 21f49f609ed4..4ded9b0499c3 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/other.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/other.json
@@ -32,6 +32,15 @@
         "SampleAfterValue": "203",
         "UMask": "0x1"
     },
+    {
+        "BriefDescription": "Increments whenever there is an update to the=
 LBR array. [This event is alias to MISC_RETIRED.LBR_INSERTS]",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xcc",
+        "EventName": "LBR_INSERTS.ANY",
+        "PublicDescription": "Increments when an entry is added to the Las=
t Branch Record (LBR) array (or removed from the array in case of RETURNs i=
n call stack mode). The event requires LBR enable via IA32_DEBUGCTL MSR and=
 branch type selection via MSR_LBR_SELECT. [This event is alias to MISC_RET=
IRED.LBR_INSERTS]",
+        "SampleAfterValue": "100003",
+        "UMask": "0x20"
+    },
     {
         "BriefDescription": "Counts streaming stores that have any type of=
 response.",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json b/t=
ools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
index 1fa7957956df..035c01540cf7 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
@@ -200,11 +200,11 @@
         "UMask": "0x20"
     },
     {
-        "BriefDescription": "This event counts the number of mispredicted =
ret instructions retired. Non PEBS",
+        "BriefDescription": "This event counts the number of mispredicted =
ret instructions retired.",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0xc5",
         "EventName": "BR_MISP_RETIRED.RET",
-        "PublicDescription": "This is a non-precise version (that is, does=
 not use PEBS) of the event that counts mispredicted return instructions re=
tired. Available PDIST counters: 0",
+        "PublicDescription": "This event counts the number of mispredicted=
 ret instructions retired. Available PDIST counters: 0",
         "SampleAfterValue": "100007",
         "UMask": "0x8"
     },
@@ -502,7 +502,7 @@
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0xc0",
         "EventName": "INST_RETIRED.REP_ITERATION",
-        "PublicDescription": "Number of iterations of Repeat (REP) string =
retired instructions such as MOVS, CMPS, and SCAS. Each has a byte, word, a=
nd doubleword version and string instructions can be repeated using a repet=
ition prefix, REP, that allows their architectural execution to be repeated=
 a number of times as specified by the RCX register. Note the number of ite=
rations is implementation-dependent.",
+        "PublicDescription": "Number of iterations of Repeat (REP) string =
retired instructions such as MOVS, CMPS, and SCAS. Each has a byte, word, a=
nd doubleword version and string instructions can be repeated using a repet=
ition prefix, REP, that allows their architectural execution to be repeated=
 a number of times as specified by the RCX register. Note: Since the number=
 of iterations within a REP instruction can be significantly affected by fa=
st strings, this event may vary from run to run and not match the architect=
ural number of iterations (specified by RCX).",
         "SampleAfterValue": "2000003",
         "UMask": "0x8"
     },
@@ -723,11 +723,11 @@
         "UMask": "0x20"
     },
     {
-        "BriefDescription": "Increments whenever there is an update to the=
 LBR array.",
+        "BriefDescription": "Increments whenever there is an update to the=
 LBR array. [This event is alias to LBR_INSERTS.ANY]",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0xcc",
         "EventName": "MISC_RETIRED.LBR_INSERTS",
-        "PublicDescription": "Increments when an entry is added to the Las=
t Branch Record (LBR) array (or removed from the array in case of RETURNs i=
n call stack mode). The event requires LBR enable via IA32_DEBUGCTL MSR and=
 branch type selection via MSR_LBR_SELECT.",
+        "PublicDescription": "Increments when an entry is added to the Las=
t Branch Record (LBR) array (or removed from the array in case of RETURNs i=
n call stack mode). The event requires LBR enable via IA32_DEBUGCTL MSR and=
 branch type selection via MSR_LBR_SELECT. [This event is alias to LBR_INSE=
RTS.ANY]",
         "SampleAfterValue": "100003",
         "UMask": "0x20"
     },
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json b/=
tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
index ddb0f65307f4..d7a6ae230e61 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
@@ -573,6 +573,19 @@
         "UMask": "0x1",
         "Unit": "IIO"
     },
+    {
+        "BriefDescription": "Peer to peer read request for 4 bytes made by=
 a different IIO unit to this IIO unit",
+        "Counter": "2,3",
+        "EventCode": "0xc0",
+        "EventName": "UNC_IIO_DATA_REQ_BY_CPU.PEER_READ.ALL_PARTS",
+        "Experimental": "1",
+        "FCMask": "0x07",
+        "PerPkg": "1",
+        "PortMask": "0x00FF",
+        "PublicDescription": "Number of DWs (4 bytes) requested by the mai=
n die.  Includes all requests initiated by the main die, including reads an=
d writes. : x16 card plugged in to stack, Or x8 card plugged in to Lane 0/1=
, Or x4 card is plugged in to slot 0",
+        "UMask": "0x8",
+        "Unit": "IIO"
+    },
     {
         "BriefDescription": "Peer to peer read request for 4 bytes made by=
 a different IIO unit to IIO Part0",
         "Counter": "2,3",
@@ -677,6 +690,19 @@
         "UMask": "0x8",
         "Unit": "IIO"
     },
+    {
+        "BriefDescription": "Peer to peer write request of 4 bytes made to=
 this IIO by a different IIO unit",
+        "Counter": "2,3",
+        "EventCode": "0xc0",
+        "EventName": "UNC_IIO_DATA_REQ_BY_CPU.PEER_WRITE.ALL_PARTS",
+        "Experimental": "1",
+        "FCMask": "0x07",
+        "PerPkg": "1",
+        "PortMask": "0x00FF",
+        "PublicDescription": "Number of DWs (4 bytes) requested by the mai=
n die.  Includes all requests initiated by the main die, including reads an=
d writes. : x16 card plugged in to stack, Or x8 card plugged in to Lane 0/1=
, Or x4 card is plugged in to slot 0",
+        "UMask": "0x2",
+        "Unit": "IIO"
+    },
     {
         "BriefDescription": "Peer to peer write request of 4 bytes made to=
 IIO Part0 by a different IIO unit",
         "Counter": "2,3",
@@ -1104,6 +1130,32 @@
         "UMask": "0x1",
         "Unit": "IIO"
     },
+    {
+        "BriefDescription": "Peer to peer read request for 4 bytes made by=
 IIO any part to an IIO target",
+        "Counter": "0,1",
+        "EventCode": "0x83",
+        "EventName": "UNC_IIO_DATA_REQ_OF_CPU.PEER_READ.ALL_PARTS",
+        "Experimental": "1",
+        "FCMask": "0x07",
+        "PerPkg": "1",
+        "PortMask": "0x00FF",
+        "PublicDescription": "Number of DWs (4 bytes) the card requests of=
 the main die.    Includes all requests initiated by the Card, including re=
ads and writes. : x16 card plugged in to stack, Or x8 card plugged in to La=
ne 0/1, Or x4 card is plugged in to slot 0",
+        "UMask": "0x8",
+        "Unit": "IIO"
+    },
+    {
+        "BriefDescription": "Peer to peer write request of 4 bytes made by=
 any IIO part to an IIO target",
+        "Counter": "0,1",
+        "EventCode": "0x83",
+        "EventName": "UNC_IIO_DATA_REQ_OF_CPU.PEER_WRITE.ALL_PARTS",
+        "Experimental": "1",
+        "FCMask": "0x07",
+        "PerPkg": "1",
+        "PortMask": "0x00FF",
+        "PublicDescription": "Number of DWs (4 bytes) the card requests of=
 the main die.    Includes all requests initiated by the Card, including re=
ads and writes. : x16 card plugged in to stack, Or x8 card plugged in to La=
ne 0/1, Or x4 card is plugged in to slot 0",
+        "UMask": "0x2",
+        "Unit": "IIO"
+    },
     {
         "BriefDescription": "Peer to peer write request of 4 bytes made by=
 IIO Part0 to an IIO target",
         "Counter": "0,1",
@@ -1827,7 +1879,6 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x8e",
         "EventName": "UNC_IIO_NUM_REQ_OF_CPU_BY_TGT.UBOX_POSTED",
-        "Experimental": "1",
         "FCMask": "0x01",
         "PerPkg": "1",
         "PortMask": "0x00FF",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 27eaf934b925..3753ff64835e 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -9,7 +9,7 @@ GenuineIntel-6-4F,v23,broadwellx,core
 GenuineIntel-6-55-[56789ABCDEF],v1.25,cascadelakex,core
 GenuineIntel-6-DD,v1.04,clearwaterforest,core
 GenuineIntel-6-9[6C],v1.05,elkhartlake,core
-GenuineIntel-6-CF,v1.24,emeraldrapids,core
+GenuineIntel-6-CF,v1.25,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.13,grandridge,core
--=20
2.56.0.rc1.310.g51773c2048-goog

