Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741612;
	b=UqyFSSxNQHfHsTnWZX4isbvIRkJH8wf3OAskSO53uHbQ39v1wDlGw4g6vhqLgdzJFj8z
	 ik5SkmohfqbZ8Zu6eda5cS8JtWHssi2EgAyYFVYiCnikRJzEkpXizfivI61upyT5dEqIJ
	 SVolVK70Qw83xckRmQA3BKzogBRQGpWyjDLN5jxhi59vThnvG0i4kmqI4BI5iiB3Hk1GI
	 ooRmEfwP6mYqt+DrFjEq+c4twybEgwavnPfTByfCh8bdqDfabIHbamBS8MgMkB7J7UYLE
	 OKqaqzkeZuKWC4qjovP8uBeL3nHltTWXJzdwQUJs/Cbv5EgjUbrgRRYcWYfbtS9WDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i1/WuK8dW5/pyvLMu4dA8Lh0jH9UtF3/CqDkw4QhSPY=;
	b=sCfV4iejzXyijdcVnUuDrx9Cgc5QWSlOJIj/KOQ7rnh3wYZrEq1geDvgZPW6SMn25LH5
	 uKXLB5Lyk0nvONxhq2yBZdoKK7adihXnEpvqSpjpTiEYvdGquQ8O20V6sKaWjmnJFoCKV
	 nEFc7wgzpX+fZ0GeTPQqR301zvQASBRkxjXIYat2uydR54sIYfPem0aCkJWglH2aEW4pm
	 dqmJjEsrXrqTgCN+de+kWvfZIYeaLQjJxqETjasDOOlquVmPmUBdPtfCArRkc2g++yuTY
	 +JPkqSQ+XUq5+HK87Zpt1boOk9OOwAhblC/cXnMlf55XqDLzUvtetBN8S/2P63vXBhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="gLUVI/dI";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1059606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1059606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gLUVI/dI
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so1412684eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741611; x=1793346411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1/WuK8dW5/pyvLMu4dA8Lh0jH9UtF3/CqDkw4QhSPY=;
        b=gLUVI/dIEd9vBiMkDhXsj8+YVnMcrVQsxvJ5ik4bFIFFJ4z8mLo/KqLzkbhwS+/osh
         fI0QmxElIyjO4ODs4QICbt7cP4pQreas0g1/RDyGQ/VebbKcpMmfQZz7J/QaK8JgXcBX
         Gb+unwyAkDA8yfosvfGIk+ML/qeQACYS50a8EZxWFM8WJJ5M9hVD47CBEmltbbLxw/Dw
         TEaxWugn4zyoWNvDjfiVS9KplYxVi9AxV00p5SQ1yeBUa50HsUdeW4h8vTjYbkXMkjL1
         pOJNW935Ai8d7sQkqOfsSqDcgRKX+VIXGFFdcMiF88Cwgx3Cm8beKQ/mKorPCZuyfEd2
         CC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741611; x=1793346411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1/WuK8dW5/pyvLMu4dA8Lh0jH9UtF3/CqDkw4QhSPY=;
        b=HNBWUkbYhtxVb812y8M6O92/qev85VD4xzq2f9rSAFMW48qNHNdQSTgV8+uBPXoEe7
         A5BP7Lj6THDXm/1eLaVK8zMcYLFofOGShhIVZGIPOyKTGRMqJXg36VLuEZrnQ3ivtDSF
         awOFk9pmtir5bOVCIEUh53AN2o2YKKcCDgSrCIcZvPRlx4RoOpu2J0WKEDGvkPKVxovt
         gd2wqnA9R890jdj+ElljmZdXJISYte9tTXNxpqRH1xb+XAuoCzRL2N2XtMwptf0Hskaw
         jPB45Y5+mCtG/RhK8wee9389y2qLkJr7fuGqdy4lheHmisPkH5FkK9b8zohjW4XMtroP
         A3gw==
X-Forwarded-Encrypted: i=1; AKwUvBxmskjJDBKfbGja03wl54Ec1nwTAGAORNYULEIpby7uqNfflc+Y67OP7AckjlW+s225n/fK8YLBYJ27fh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMH1UGpBd5ExLKSUnIkmHx8FTFgSbCM1hhEYAh8pyAcphI5JJH
	z2iuidP0aEg7R67CyE7E0pYv6Rs0S05aPnRUU4UwTB7kUeB/JhZG9zfL
X-Gm-Gg: AYBFou1P+0rLk9IngLtSH6ED0H/l2bal+289FC/sa0IFP+4EmuQwnYFhVmriixI4rYt
	KUeSt+LFGof/3R/Gg9vwUGJJcdsaob0nheUAWXAPx0fp6XqRwnDRq6MKj8VpSau3TvXr47hMUbj
	h9SEQpqXY6qNVeg1puqXc0siIjwqvSCE/dLwjvfh4pDXOVuGQVpfpV9aXQhqGCxkhDkhBuzwhzA
	GqEgoe4DHF0HAZ7hLtTh/zYOaU2a3P1DS56vW74X8XWKSvmaBKd5Q1J3HsS8qT4oB8iqFaa2/cl
	nkoPD8bmZ6PUOxMAkpUA7YOpkMyU+DoWKoVVpHAsjaSQwMiPr7wDcAXZFFGZPn/SHbjU/FJ/npY
	GaBDHwP4SY8LJ6tYGPvhzgaoB6s/Vw6EjbTIKv1ZVEV7qYWNuA+azOocjLo4p6GAn3HD4Z4PCgB
	loCPPh5GJGOsoqsHRz8CEW5n5axqlpsvTTbMvdMmJ5q/K16jUwqVDBwLbjZboHcUj1NgkFdbjGK
	37i2S8M2ti/G2mNNBFuOgDT4XZ2PtEVZg5HK0tkY52S4fpXh38OgDLstsyOOes1ZzY=
X-Received: by 2002:a05:7301:619b:10b0:35d:7565:8577 with SMTP id 5a478bee46e88-369d980cabamr1885558eec.15.1792741610605;
        Fri, 23 Oct 2026 00:46:50 -0700 (PDT)
Received: from Hruday.lan ([2409:4091:903b:c404:6995:b26d:3edb:5202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9a72ff2sm4479935eec.0.2026.10.23.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:46:50 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>
Cc: Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+e1268acad3c273b12120@syzkaller.appspotmail.com,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] ACPI: ACPICA: Fall back to inline recursion if update state allocation fails
Date: Fri, 23 Oct 2026 13:15:02 +0530
Message-ID: <20261023074502.103681-1-shreeramrahul94@gmail.com>
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
Content-Transfer-Encoding: 8bit

When acpi_ut_update_object_reference() traverses nested package elements
or field elements to increment/decrement reference counts, it allocates a
temporary union acpi_generic_state via
acpi_ut_create_update_state_and_push()
to avoid deep C stack recursion.

If memory allocation fails (for instance, under slab fault injection),
the function aborts mid-traversal. This leaves sub-object reference counts
out of sync with parent containers. Callers cannot readily roll back the
partial updates, leading to reference count underflows and slab
use-after-free bugs (such as in acpi_ns_check_package()).

Fix this by introducing acpi_ut_push_or_update_object(). When allocating
a deferred update state fails, fall back to inline recursive traversal up
to a safe bounded recursion limit (ACPI_UT_MAX_UPDATE_DEPTH = 16). This
ensures reference counts remain consistent even during severe memory
pressure.

Reported-by: syzbot+e1268acad3c273b12120@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e1268acad3c273b12120
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/acpi/acpica/utdelete.c | 78 +++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/acpica/utdelete.c b/drivers/acpi/acpica/utdelete.c
index e8180099d01f..87ae66c7eee8 100644
--- a/drivers/acpi/acpica/utdelete.c
+++ b/drivers/acpi/acpica/utdelete.c
@@ -20,6 +20,14 @@ static void acpi_ut_delete_internal_obj(union acpi_operand_object *object);
 static void
 acpi_ut_update_ref_count(union acpi_operand_object *object, u32 action);
 
+static acpi_status
+acpi_ut_update_object_reference_depth(union acpi_operand_object *object,
+				      u16 action, u32 depth);
+
+/* Max inline nesting used when a deferred update state cannot be allocated */
+
+#define ACPI_UT_MAX_UPDATE_DEPTH	16
+
 /*******************************************************************************
  *
  * FUNCTION:    acpi_ut_delete_internal_obj
@@ -457,6 +465,28 @@ acpi_ut_update_ref_count(union acpi_operand_object *object, u32 action)
 	}
 }
 
+/*
+ * Queue an object for a later reference count update. If the update state
+ * cannot be allocated, update the object right away instead of failing: an
+ * update abandoned half way leaves the counts of the sub-objects out of
+ * step with the count of their parent, and callers (most of which cannot
+ * handle an error) would later drop references that were never added.
+ */
+static acpi_status
+acpi_ut_push_or_update_object(union acpi_operand_object *object, u16 action,
+			      union acpi_generic_state **state_list, u32 depth)
+{
+	acpi_status status;
+
+	status = acpi_ut_create_update_state_and_push(object, action,
+						      state_list);
+	if (ACPI_SUCCESS(status) || depth >= ACPI_UT_MAX_UPDATE_DEPTH)
+		return status;
+
+	return acpi_ut_update_object_reference_depth(object, action,
+						      depth + 1);
+}
+
 /*******************************************************************************
  *
  * FUNCTION:    acpi_ut_update_object_reference
@@ -480,6 +510,13 @@ acpi_ut_update_ref_count(union acpi_operand_object *object, u32 action)
 
 acpi_status
 acpi_ut_update_object_reference(union acpi_operand_object *object, u16 action)
+{
+	return acpi_ut_update_object_reference_depth(object, action, 0);
+}
+
+static acpi_status
+acpi_ut_update_object_reference_depth(union acpi_operand_object *object,
+				      u16 action, u32 depth)
 {
 	acpi_status status = AE_OK;
 	union acpi_generic_state *state_list = NULL;
@@ -560,8 +597,9 @@ acpi_ut_update_object_reference(union acpi_operand_object *object, u16 action)
 					 * for later processing (this eliminates recursion.)
 					 */
 					status =
-					    acpi_ut_create_update_state_and_push
-					    (next_object, action, &state_list);
+					    acpi_ut_push_or_update_object
+					    (next_object, action, &state_list,
+					     depth);
 					if (ACPI_FAILURE(status)) {
 						goto error_exit;
 					}
@@ -579,31 +617,23 @@ acpi_ut_update_object_reference(union acpi_operand_object *object, u16 action)
 
 		case ACPI_TYPE_LOCAL_BANK_FIELD:
 
-			next_object = object->bank_field.bank_obj;
-			status =
-			    acpi_ut_create_update_state_and_push(object->
-								 bank_field.
-								 region_obj,
-								 action,
-								 &state_list);
-			if (ACPI_FAILURE(status)) {
-				goto error_exit;
-			}
-			break;
+		next_object = object->bank_field.bank_obj;
+		status = acpi_ut_push_or_update_object(
+				object->bank_field.region_obj, action,
+				&state_list, depth);
+		if (ACPI_FAILURE(status))
+			goto error_exit;
+		break;
 
 		case ACPI_TYPE_LOCAL_INDEX_FIELD:
 
-			next_object = object->index_field.index_obj;
-			status =
-			    acpi_ut_create_update_state_and_push(object->
-								 index_field.
-								 data_obj,
-								 action,
-								 &state_list);
-			if (ACPI_FAILURE(status)) {
-				goto error_exit;
-			}
-			break;
+		next_object = object->index_field.index_obj;
+		status = acpi_ut_push_or_update_object(
+				object->index_field.data_obj, action,
+				&state_list, depth);
+		if (ACPI_FAILURE(status))
+			goto error_exit;
+		break;
 
 		case ACPI_TYPE_LOCAL_REFERENCE:
 			/*
-- 
2.43.0

