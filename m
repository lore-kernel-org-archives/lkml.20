Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A43377A97
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480175; cv=none; b=ZYqSb21TXfovK6XYXO9AfFdrGnNqaG0vW4y+yNDXbRPNpiDmsDCPU0e/9b7NeLX35np++gvIRcUXhOEm7c3Fi+NAXfT3rlLhdTJFRddbmWu6f38fm0wW7rwrZeyo/2HGe1k3mrNFDz9R8t16299jmhNO8EPGEdlxNHyiqqQ8Xe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480175; c=relaxed/simple;
	bh=jp9qCNCcoyn9+anAEvsmUT1GBnYM3MqMBdipcbGDjEc=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=pzw4CzE4MeM2vdx+rFlUID2zv6698rJhK1GR8ccn0D5dknthaY5c6k7gHL/uW8N32i8HJye4E2Jxu8Iv7tNMQuMRHIShx2KoDJ4l2evukfXC3UfypGsMpOTGtUD51iaV+yzEiU60fjL0bPrTp2due4N16L9BxtOfvfXOwtrVZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vltcore.site; spf=pass smtp.mailfrom=vltcore.site; dkim=pass (2048-bit key) header.d=vltcore.site header.i=@vltcore.site header.b=Su8wYkdH; arc=none smtp.client-ip=23.83.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vltcore.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vltcore.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vltcore.site header.i=@vltcore.site header.b="Su8wYkdH"
X-Sender-Id: hostingeremail|x-authuser|fixedpoint.alpha@vltcore.site
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BD0C37A03B5;
	Tue, 15 Sep 2026 13:49:31 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.99.41.5])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DF2887A2BA0;
	Tue, 15 Sep 2026 13:49:30 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|fixedpoint.alpha@vltcore.site
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|fixedpoint.alpha@vltcore.site
X-MailChannels-Auth-Id: hostingeremail
X-Invention-Occur: 75dba37000c1ddc2_1789480171641_2795971287
X-MC-Loop-Signature: 1789480171641:936763890
X-MC-Ingress-Time: 1789480171641
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.41.5 (trex/8.0.2);
	Tue, 15 Sep 2026 13:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vltcore.site;
	s=hostingermail-a; t=1789480169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HMganvIYjKOxGQrcWH3qrcjH0/5x0st2sTedV5lBCXI=;
	b=Su8wYkdHPnv1cy/BnsFtaCx3BoSPe6FU3xPV6+S562QXq02ZKfjj5KRaERk8w5E8OHMTXg
	COmfA3XH/OdTrnDox4bcDAQiaAZm+39lRyKZ3GFLVnGR+OJNV3MAu2WIQGa+NXzoHwejy9
	ETmyytfocwX0pTnDzgc75EocC/EJpibpJBnaVa7sWd8yJiz5Tp7ovcrz9yLUg1Z1CXJ1GB
	u46FgXFAJio4KYhq1ZzpGcVDerYwaPjz6UNah4jjleDvapKftQmp0ABSLl+2XYOuQlRRid
	9o56BtCmtkSTV4iNx2glSpXO4skt8Zd4pkv7F1tduTiQXmZjc5Noh+f1hQcMXA==
Received: from LAPTOP-IDEH09IR (unknown [IPv6:2401:4900:88e2:2d85:94d8:af8a:84a8:31e6])
	(Authenticated sender: fixedpoint.alpha@vltcore.site)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4hkk0767djz44Zr;
	Tue, 15 Sep 2026 13:49:27 +0000 (UTC)
From: Systems Architect Alpha <fixedpoint.alpha@vltcore.site>
To: linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Systems Architect Alpha <fixedpoint.alpha@vltcore.site>
Subject: [PATCH] gnss: add optimized fixed-point integer coordinate conversion engine for NavIC hybrid arrays
Message-ID: <20260915134911.1619-1-fixedpoint.alpha@vltcore.site>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Tue, 15 Sep 2026 13:49:27 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=6aa94ce8 a=WtxJD09HT2rqGmHuIrjRgw==:617 a=xqWC_Br6kY4A:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=z66DxoSdU25WS6fmMZgA:9 a=RVmHIydaz68A:10 a=uFLhvPdPfAbhkKq7rPGx:22 a=NWVoK91CQySWRX1oVYDe:22
X-CM-Envelope: MS4xfF8XEe+rSicu83j5XX8SaQg5xR2wn8GyA5BuR6yhKbKVcbsgo7aND6GKdj83PM5i6TratK1n7XoxFRTLMyV36+qQPu/YmqP1llMoLv7H318Cn4NdLvtd cPiHdc6I4Vz7teN75BDIuvgnRMulxR2ApFXRJd7FbQsCrDtemcGfEeYVeWs95uhiYvLJSJeH+p6P7SaCYFaPsYNh6EcVKzXkegpORDEC5IqAIrRk/N+fTb8s 96A+jjoHNrekBzFSOhgduPok5pE5gm7n/CVA0lUp7Kb/pdaI7wx18334Ayhq4aJW5/jnPWh4375Qs53rae3z7Mj2whwGOs24r51PhXy8glEtPNE3Lyo4qvrV sz9JYzlh
X-AuthUser: fixedpoint.alpha@vltcore.site

Change-Id: Iff119be8f6071768744deb68c3dc5d9058eaaeef
---
 CMakeLists.txt                 |  66 ++++++++++++++
 include/navic_constants.h      |  63 ++++++++++++++
 src/dynamic_matrix_profile.cpp | 130 +++++++++++++++++++++++++++
 src/static_matrix_profile.c    | 155 +++++++++++++++++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 CMakeLists.txt
 create mode 100644 include/navic_constants.h
 create mode 100644 src/dynamic_matrix_profile.cpp
 create mode 100644 src/static_matrix_profile.c

diff --git a/CMakeLists.txt b/CMakeLists.txt
new file mode 100644
index 0000000000..a931428ed2
--- /dev/null
+++ b/CMakeLists.txt
@@ -0,0 +1,66 @@
+cmake_minimum_required(VERSION 3.10)
+project(navic_fixed_point_hal C CXX)
+
+set(CMAKE_C_STANDARD 11)
+set(CMAKE_CXX_STANDARD 17)
+
+if(MSVC)
+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /W4 /O2 /fp:fast")
+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /O2 /fp:fast")
+else()
+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -O2 -ffast-math")
+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -O2 -ffast-math")
+endif()
+
+include_directories(${PROJECT_SOURCE_DIR}/include)
+
+set(STATIC_PROFILE_SOURCES
+    src/static_matrix_profile.c
+)
+
+add_library(navic_static_profile STATIC ${STATIC_PROFILE_SOURCES})
+target_compile_definitions(navic_static_profile PRIVATE
+	NAVIC_SCALE_FACTOR=16777216)
+
+set(DYNAMIC_PROFILE_SOURCES
+    src/dynamic_matrix_profile.cpp
+)
+
+add_library(navic_dynamic_profile STATIC ${DYNAMIC_PROFILE_SOURCES})
+target_compile_definitions(navic_dynamic_profile PRIVATE
+	NAVIC_SCALE_FACTOR=16777216)
+
+enable_testing()
+
+set(TEST_SOURCES
+    tests/solidity_audit_benchmark.cpp
+)
+
+add_executable(navic_benchmark ${TEST_SOURCES})
+target_link_libraries(navic_benchmark navic_dynamic_profile)
+
+add_test(NAME SolidityAuditBenchmark COMMAND navic_benchmark)
+
+option(BUILD_STATIC_PROFILE "Build static C profile for IoT/legacy" ON)
+option(BUILD_DYNAMIC_PROFILE
+	"Build dynamic C++ profile for smartphones/drones" ON)
+option(BUILD_TESTS "Build test suite" ON)
+
+if(NOT BUILD_STATIC_PROFILE)
+    set_target_properties(navic_static_profile PROPERTIES
+		EXCLUDE_FROM_ALL TRUE)
+endif()
+
+if(NOT BUILD_DYNAMIC_PROFILE)
+    set_target_properties(navic_dynamic_profile PROPERTIES
+		EXCLUDE_FROM_ALL TRUE)
+endif()
+
+if(NOT BUILD_TESTS)
+    set_target_properties(navic_benchmark PROPERTIES EXCLUDE_FROM_ALL TRUE)
+endif()
+
+install(FILES include/navic_constants.h DESTINATION include)
+install(TARGETS navic_static_profile navic_dynamic_profile
+        LIBRARY DESTINATION lib
+        ARCHIVE DESTINATION lib)
diff --git a/include/navic_constants.h b/include/navic_constants.h
new file mode 100644
index 0000000000..8f2b621a03
--- /dev/null
+++ b/include/navic_constants.h
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+/*
+ * Copyright (C) 2026 Independent Solo Operator. All rights reserved.
+ * 
+ * This software is dual-licensed under the GPL v2 or the 3-Clause BSD License.
+ * Suitable for integration into FRAND-compliant Standard Essential Patent
+ * (SEP) pools.
+ */
+
+#ifndef _NAVIC_CONSTANTS_H
+#define _NAVIC_CONSTANTS_H
+
+#include <stdint.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define NAVIC_SCALE_FACTOR (1 << 24)
+#define NAVIC_SCALE_SHIFT 24
+#define NAVIC_INV_SCALE (1.0 / (double)NAVIC_SCALE_FACTOR)
+
+#define INT32_MAX_CLAMP(x) (((x) > INT32_MAX) ? INT32_MAX : (x))
+#define INT32_MIN_CLAMP(x) (((x) < INT32_MIN) ? INT32_MIN : (x))
+
+#define NAVIC_SAFE_ADD(a, b) \
+    (((b) > 0 && (a) > INT32_MAX - (b)) ? INT32_MAX : \
+     ((b) < 0 && (a) < INT32_MIN - (b)) ? INT32_MIN : (a) + (b))
+
+#define NAVIC_SAFE_SUB(a, b) \
+    (((b) < 0 && (a) > INT32_MAX + (b)) ? INT32_MAX : \
+     ((b) > 0 && (a) < INT32_MIN + (b)) ? INT32_MIN : (a) - (b))
+
+#define NAVIC_CORDIC_ITERATIONS 16
+#define NAVIC_CORDIC_GAIN 0x60758C5
+
+static const int32_t navic_cordic_angles[NAVIC_CORDIC_ITERATIONS] = {
+    0xC90FDA, 0x7621E7, 0x3EB6C2, 0x1FD5BA,
+    0x0FFAB9, 0x07FFD5, 0x03FFF9, 0x01FFFF,
+    0x010000, 0x008000, 0x004000, 0x002000,
+    0x001000, 0x000800, 0x000400, 0x000200
+};
+
+#define NAVIC_TRIG_LUT_SIZE 64
+
+static const int32_t navic_sin_lut[NAVIC_TRIG_LUT_SIZE] = {
+    0x000000, 0x00647D, 0x00C8FA, 0x012D76, 0x0191F1, 0x01F66B, 0x025AE3,
+    0x02BF5A, 0x0323CF, 0x038841, 0x03ECB0, 0x04511C, 0x04B585, 0x0519EA,
+    0x057E4B, 0x05E2A8, 0x064700, 0x06AB53, 0x070FA1, 0x0773EA, 0x07D82E,
+    0x083C6D, 0x08A0A6, 0x0904D9, 0x096906, 0x09CD2D, 0x0A314E, 0x0A9569,
+    0x0AF97E, 0x0B5D8C, 0x0BC194, 0x0C2594, 0x0C898C, 0x0CED7C, 0x0D5164,
+    0x0DB545, 0x0E191E, 0x0E7CEF, 0x0EE0B8, 0x0F447B, 0x0FA835, 0x100BE5,
+    0x106F8D, 0x10D32E, 0x1136C9, 0x119A5C, 0x11FDE6, 0x126169, 0x12C4E6,
+    0x13285D, 0x138BCB, 0x13EF30, 0x14528E, 0x14B5E6, 0x151937, 0x157C81,
+    0x15DFC2, 0x162FFB, 0x16932E, 0x16F65B, 0x17597F, 0x17BC9C, 0x181FB2,
+    0x1882C1
+};
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* _NAVIC_CONSTANTS_H */
diff --git a/src/dynamic_matrix_profile.cpp b/src/dynamic_matrix_profile.cpp
new file mode 100644
index 0000000000..7f4b484cba
--- /dev/null
+++ b/src/dynamic_matrix_profile.cpp
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+/*
+ * Copyright (C) 2026 Independent Solo Operator. All rights reserved.
+ * 
+ * This software is dual-licensed under the GPL v2 or the 3-Clause BSD License.
+ * Suitable for integration into FRAND-compliant Standard Essential Patent
+ * (SEP) pools.
+ */
+
+#include "navic_constants.h"
+#include <cstdint>
+#include <cstring>
+
+namespace navic {
+
+struct TelemetryPoint {
+    int32_t x;
+    int32_t y;
+    int32_t z;
+};
+
+struct CoordinateStream {
+    const TelemetryPoint* data;
+    size_t length;
+    size_t index;
+};
+
+class DynamicMatrixProcessor {
+private:
+    CoordinateStream stream;
+    bool processing_active;
+
+    static int32_t cordic_sin(int32_t angle) {
+        int32_t x = NAVIC_CORDIC_GAIN;
+        int32_t y = 0;
+        int32_t z = angle;
+        int32_t d;
+
+        for (int i = 0; i < NAVIC_CORDIC_ITERATIONS; i++) {
+            d = (z >= 0) ? 1 : -1;
+            int32_t x_new = x - (d * (y >> i));
+            int32_t y_new = y + (d * (x >> i));
+            z = z - (d * navic_cordic_angles[i]);
+            x = x_new;
+            y = y_new;
+        }
+        return y;
+    }
+
+    static int32_t cordic_cos(int32_t angle) {
+        int32_t x = NAVIC_CORDIC_GAIN;
+        int32_t y = 0;
+        int32_t z = angle;
+        int32_t d;
+
+        for (int i = 0; i < NAVIC_CORDIC_ITERATIONS; i++) {
+            d = (z >= 0) ? 1 : -1;
+            int32_t x_new = x - (d * (y >> i));
+            int32_t y_new = y + (d * (x >> i));
+            z = z - (d * navic_cordic_angles[i]);
+            x = x_new;
+            y = y_new;
+        }
+        return x;
+    }
+
+public:
+    DynamicMatrixProcessor() : processing_active(false) {
+        stream.data = nullptr;
+        stream.length = 0;
+        stream.index = 0;
+    }
+
+    void initialize_stream(const TelemetryPoint* data, size_t len) {
+        stream.data = data;
+        stream.length = len;
+        stream.index = 0;
+        processing_active = true;
+    }
+
+    bool process_next_batch(size_t batch_size) {
+        if (!processing_active || stream.data == nullptr) {
+            return false;
+        }
+
+        size_t end_index = (stream.index + batch_size > stream.length) 
+                          ? stream.length 
+                          : stream.index + batch_size;
+
+        for (size_t i = stream.index; i < end_index; i++) {
+            TelemetryPoint pt = stream.data[i];
+            
+            int32_t rotated_x = NAVIC_SAFE_ADD(
+                (cordic_cos(pt.x) * pt.x) >> NAVIC_SCALE_SHIFT,
+                (cordic_sin(pt.y) * pt.y) >> NAVIC_SCALE_SHIFT
+            );
+            
+            int32_t rotated_y = NAVIC_SAFE_SUB(
+                (cordic_cos(pt.x) * pt.y) >> NAVIC_SCALE_SHIFT,
+                (cordic_sin(pt.y) * pt.x) >> NAVIC_SCALE_SHIFT
+            );
+
+            rotated_x = INT32_MAX_CLAMP(rotated_x);
+            rotated_y = INT32_MIN_CLAMP(rotated_y);
+        }
+
+        stream.index = end_index;
+        
+        if (stream.index >= stream.length) {
+            processing_active = false;
+            return false;
+        }
+
+        return true;
+    }
+
+    bool is_processing_complete() const {
+        return !processing_active || stream.index >= stream.length;
+    }
+
+    size_t get_progress() const {
+        return stream.index;
+    }
+
+    size_t get_total_length() const {
+        return stream.length;
+    }
+};
+
+} // namespace navic
diff --git a/src/static_matrix_profile.c b/src/static_matrix_profile.c
new file mode 100644
index 0000000000..2c2dacd05d
--- /dev/null
+++ b/src/static_matrix_profile.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+/*
+ * Copyright (C) 2026 Independent Solo Operator. All rights reserved.
+ * 
+ * This software is dual-licensed under the GPL v2 or the 3-Clause BSD License.
+ * Suitable for integration into FRAND-compliant Standard Essential Patent
+ * (SEP) pools.
+ */
+
+#include "navic_constants.h"
+#include <stddef.h>
+#include <stdint.h>
+
+typedef struct {
+    int32_t x;
+    int32_t y;
+    int32_t z;
+} navic_point_t;
+
+typedef struct {
+    const navic_point_t* data;
+    size_t length;
+    size_t index;
+} navic_stream_t;
+
+static int32_t navic_cordic_sin_c(int32_t angle) {
+    int32_t x = NAVIC_CORDIC_GAIN;
+    int32_t y = 0;
+    int32_t z = angle;
+    int32_t d;
+    int i;
+
+    for (i = 0; i < NAVIC_CORDIC_ITERATIONS; i++) {
+        d = (z >= 0) ? 1 : -1;
+        int32_t x_new = x - (d * (y >> i));
+        int32_t y_new = y + (d * (x >> i));
+        z = z - (d * navic_cordic_angles[i]);
+        x = x_new;
+        y = y_new;
+    }
+    return y;
+}
+
+static int32_t navic_cordic_cos_c(int32_t angle) {
+    int32_t x = NAVIC_CORDIC_GAIN;
+    int32_t y = 0;
+    int32_t z = angle;
+    int32_t d;
+    int i;
+
+    for (i = 0; i < NAVIC_CORDIC_ITERATIONS; i++) {
+        d = (z >= 0) ? 1 : -1;
+        int32_t x_new = x - (d * (y >> i));
+        int32_t y_new = y + (d * (x >> i));
+        z = z - (d * navic_cordic_angles[i]);
+        x = x_new;
+        y = y_new;
+    }
+    return x;
+}
+
+void navic_stream_init(navic_stream_t* stream, const navic_point_t* data,
+			size_t len) {
+    if (stream == NULL) {
+        return;
+    }
+    stream->data = data;
+    stream->length = len;
+    stream->index = 0;
+}
+
+int navic_process_point(const navic_point_t* point, navic_point_t* output) {
+    int32_t cos_x, sin_x, cos_y, sin_y;
+    int32_t rotated_x, rotated_y;
+    int32_t temp1, temp2;
+
+    if (point == NULL || output == NULL) {
+        return -1;
+    }
+
+    cos_x = navic_cordic_cos_c(point->x);
+    sin_x = navic_cordic_sin_c(point->x);
+    cos_y = navic_cordic_cos_c(point->y);
+    sin_y = navic_cordic_sin_c(point->y);
+
+    temp1 = (cos_x * point->x) >> NAVIC_SCALE_SHIFT;
+    temp2 = (sin_y * point->y) >> NAVIC_SCALE_SHIFT;
+    rotated_x = NAVIC_SAFE_ADD(temp1, temp2);
+    rotated_x = INT32_MAX_CLAMP(rotated_x);
+    rotated_x = INT32_MIN_CLAMP(rotated_x);
+
+    temp1 = (cos_x * point->y) >> NAVIC_SCALE_SHIFT;
+    temp2 = (sin_y * point->x) >> NAVIC_SCALE_SHIFT;
+    rotated_y = NAVIC_SAFE_SUB(temp1, temp2);
+    rotated_y = INT32_MAX_CLAMP(rotated_y);
+    rotated_y = INT32_MIN_CLAMP(rotated_y);
+
+    output->x = rotated_x;
+    output->y = rotated_y;
+    output->z = point->z;
+
+    return 0;
+}
+
+int navic_process_stream(navic_stream_t* stream, navic_point_t* output,
+			 size_t batch_size) {
+    size_t i;
+    size_t end_index;
+    int result;
+
+    if (stream == NULL || output == NULL) {
+        return -1;
+    }
+
+    if (stream->data == NULL || stream->index >= stream->length) {
+        return 0;
+    }
+
+    end_index = stream->index + batch_size;
+    if (end_index > stream->length) {
+        end_index = stream->length;
+    }
+
+    for (i = stream->index; i < end_index; i++) {
+        result = navic_process_point(&stream->data[i],
+				     &output[i - stream->index]);
+        if (result != 0) {
+            return result;
+        }
+    }
+
+    stream->index = end_index;
+    return (int)(end_index - (stream->index - (end_index - stream->index)));
+}
+
+int navic_stream_complete(const navic_stream_t* stream) {
+    if (stream == NULL) {
+        return 1;
+    }
+    return (stream->index >= stream->length) ? 1 : 0;
+}
+
+size_t navic_stream_progress(const navic_stream_t* stream) {
+    if (stream == NULL) {
+        return 0;
+    }
+    return stream->index;
+}
+
+size_t navic_stream_length(const navic_stream_t* stream) {
+    if (stream == NULL) {
+        return 0;
+    }
+    return stream->length;
+}
-- 
2.54.0.windows.1

