Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979393;
	b=BtMk/l+oGACExoPWAvhwYGEXpaEDGFKGH2eUKbf7OeEtOcQZmspcdnUrfUuCGoUfEgDK
	 7+em296z7ZkUnlNuVMrm5as1myDU52W+IwXLmc7srJe+ZpLechnLnPhj9ER9GLcQX70B9
	 1JU/39IbxA9o/G2Q30WAryMkTnK+DPUgP8jDcgX6AW5Op4J4n5jbIUa2A7DHNoMRP6uBF
	 fq1iGhp6Nt2sD64EMIJ2HWnRi2BFnrtQRT7p847HyIHHWK+9eaiVeP/+nbuefkPE9crro
	 TOa3xkEkaK8sdrtilitGBBanQNXMMvCUqa1ymgUxmsCaBgfUtjdV6Netm2HJaeHw1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
	b=IER4cF14tDBsk1S5M+gDvnQ4quWYUMGIKyq6cxHbXFiA0ie1t5KrNtJgNwKK1fBL+6IW
	 CF6S/dYJAvNrt7W04MAiWrB69gzjeVkkwO/1OEL8vjhag+nhJJabNvFhnphUTP9g5CFtg
	 ykIZil7nQBem48UFqjD2XozwefX75XEFDbvBnjqyO75hOCzSmNwoEguFTF9So9Pck3fnT
	 9W6WRl0MiiN7XSjn5we8EiVEI7jyICqPTpOnQR7tJbFE8Xmec7m9vRNdZ8nDxd/Lgr9go
	 YOwsb3bUcTb7I9XY44HVU5mq5HH5jq6OK+BaGoxajYtf9rzI4wGqr6RasGRI1/Wx1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BeqGHU89;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1279606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1279606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BeqGHU89
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-745497ac8fcso1046962137.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979392; x=1793584192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
        b=BeqGHU89LBfAlIk5G7oO1nbbaMiFFoISCvQgV4cf/SKVcXL2ujX8i74vaUa73ZQT6/
         I1mnrJhqYcJ+2B0vcrjtCmdH2FSRoiAYx2+uCUOIhWs+GiNNorkrLnKzhamCL25WM+sf
         2lkzm9woyoMvmzOMSUMkVFYVdDE8DM8JSrI/T1jtwWRMf5ffv7jkFySsK3u20r0aKtDv
         zHd0unSINCMopDNpxDJn4l7zfDs1aOWaM2yDR9aMHZO2VJJrxS5f7KXcQWDRgucfOGgp
         lMAYhjBrPPaZsAOQmWbry+C7CetgMu5onO1z6UEaBjHkmwifHQd9NriCGAwlOsnVQS4U
         J1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979392; x=1793584192;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
        b=vIkMq++T/cV2mag6KXLcjT9r4AFfgx5RAIDdlbzbzxNT+nEEnlZm/96qzsCVoYbwSQ
         /boxaoPS93j8YFbsvg8aNHRLPMWFonxmHJBU5k66bDV3wU4vlu1K5QMLrGp1xnrislqf
         0VgC9wutfhOrlXEbjAts02opN3L0nMPxTa2XM8svASrCfXlBmdPDGNbqb9uzV9TwxnyX
         3kgnMxLeXSSfZqKIbqmDZKPK1uLxCCr+DIonvZmZLgA8XDZoU7gGYcO+eRLUvLFWr0Wv
         6l3Rd26+PqarZqQGF1NIhdZ/mi8wF5/XQ3ShoFqWQm8MF0/k9q3ZCHhtOOSjKgSiCIZq
         9hFw==
X-Forwarded-Encrypted: i=1; AKwUvBx2nFDoWiPNQOp+L3v+1jq4IdfTIrq2KbdWQzfiXSTxi0KAsN+R1b7WOIzgmE0IONXZippZUvokAE1HaIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ/X5zn/CYNns2rSevS5GpDsA6ZTaXrN0xf+L9mdRNYLU+wXVm
	Aqvxribx1DJKwaQUB6Wrvh6SQjyIjyIm70v5lT7q5SqAsJBCsRSFzbhjvnnMA6BnRN0=
X-Gm-Gg: AYBFou1v9pGPmyu5q35axN6/SZShFtBdY+NpEKB+UvCTm1cWVKqSYjypmcW6zKLjHQs
	8xGAF/8ieBRdu9gndkwBEoX4CklPrq40ZVGs6jgn1WtZPUETXcnnOcOWHbi/4dn5a7HHgjsjjNh
	4EYzDbBlWwU8dHCegRMSlnEK4dafyaqd1G10IDrZLrirgvBfdIOPS5BWFO9IQUyDCPiaKTFV+bd
	ecffHRn1bPOi+A/XhUtHmgDx0mrDbKdO/v8vxat0Mi2SvG6IP8ajSudsYKXDQGu08ekP0qgub2r
	mNZLN+LHLYCRyNU/05knkKD2D0PG2A2f9hJRCynIE7O63U75SGTeuzAtnWpwfc95DKfDPetLL0y
	bkJzBuo0LmdKf0sFbQVB3DLg6jKiWyHn0QQdhc42T/Eo33DYtrbdOpFzJRqEiwjEiywhDKaJXsk
	vYxcKbi3oPZHr6M839DjeGinknwjTnIoQ/4yajQvlBM5GzJ3W2Yej+QVG9ei7Q74meN+It5aTAL
	yeo8A3Y4vJX/FHCObZPik+9njlBPjg3fZ1QHNcsmtc0HS976Dc6kOUrboCEqNpTmnE8JDxPhU4i
	QXn2bqIU8hLu27b6MB0fu+VnIrGvGdGZhliTmyJSyAOFLIWm2gR8L9UySo+F0MjjQvdR4mgnD9R
	/
X-Received: by 2002:a05:6102:38ce:b0:7a6:b8fe:e834 with SMTP id ada2fe7eead31-7ce5cd91472mr1215927137.27.1792979391619;
        Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v4 1/3] liveupdate: Move file_set_ser handling to session serialization helpers
Date: Sun, 25 Oct 2026 21:49:44 -0400
Message-ID: <20261026014948.162559-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026014948.162559-1-pasha.tatashin@soleen.com>
References: <20261026014948.162559-1-pasha.tatashin@soleen.com>
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

Currently, struct luo_session_ser is populated and cleared across two
layers: luo_session_serialize() writes and clears ser->name, while
luo_file_freeze() and luo_file_unfreeze() write and clear
ser->file_set_ser.

In preparation for allowing userspace to freeze a session explicitly
before kexec reboot, luo_file_freeze() and luo_file_unfreeze() need to
be called on session->file_set before any struct luo_session_ser entry
is reserved in luo_session_serialize().

Drop the struct luo_file_set_ser pointer parameter from
luo_file_freeze() and luo_file_unfreeze(), and rename
luo_session_freeze_one() and luo_session_unfreeze_one() to
luo_session_serialize_one() and luo_session_unserialize_one() so that
all fields of struct luo_session_ser are populated and cleared in one
place.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c     | 24 ++++++++----------------
 kernel/liveupdate/luo_internal.h |  6 ++----
 kernel/liveupdate/luo_session.c  | 31 ++++++++++++++++++++-----------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..988eb313a135 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -440,8 +440,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
- * @file_set:     The file_set whose files are to be frozen.
- * @file_set_ser: Where to put the serialized file_set.
+ * @file_set: The file_set whose files are to be frozen.
  *
  * This function is called from the reboot() syscall path, just before the
  * kernel transitions to the new image via kexec. Its purpose is to perform the
@@ -457,8 +456,8 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * 2. Serializes Metadata: After a successful freeze, it copies the final file
  *    metadata—the handler's compatible string, the user token, and the final
- *    private data handle—into the pre-allocated contiguous memory buffer
- *    (file_set->files) that will be handed over to the next kernel via KHO.
+ *    private data handle—into the pre-allocated serialization blocks
+ *    (file_set->block_set) that will be handed over to the next kernel via KHO.
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
@@ -471,8 +470,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * Context: Called only from the liveupdate_reboot() path.
  * Return: 0 on success, or a negative errno on failure.
  */
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser)
+int luo_file_freeze(struct luo_file_set *file_set)
 {
 	struct luo_file *luo_file;
 	struct kho_block_set_it it;
@@ -506,9 +504,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser->token = luo_file->token;
 	}
 
-	file_set_ser->count = file_set->count;
-	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
-
 	return 0;
 
 err_unfreeze:
@@ -519,28 +514,25 @@ int luo_file_freeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
- * @file_set:     The file_set whose files are to be unfrozen.
- * @file_set_ser: Serialized file_set.
+ * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
  * freeze phase has begun but must be aborted. It is the counterpart to
  * luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
- * signals the helper to iterate through all files in the file_set and call
- * their respective .unfreeze() handler callbacks.
+ * signals the helper to iterate through all files in the file_set, call their
+ * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
  *          the reboot() syscall, after luo_file_freeze() has been called.
  */
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser)
+void luo_file_unfreeze(struct luo_file_set *file_set)
 {
 	if (!file_set->count)
 		return;
 
 	__luo_file_unfreeze(file_set, NULL);
-	memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..01a172cd9d7a 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -103,10 +103,8 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser);
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser);
+int luo_file_freeze(struct luo_file_set *file_set);
+void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		      struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..827f9ad1938f 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -218,18 +218,30 @@ static int luo_session_finish_one(struct luo_session *session)
 	return luo_file_finish(&session->file_set);
 }
 
-static void luo_session_unfreeze_one(struct luo_session *session,
-				     struct luo_session_ser *ser)
+static void luo_session_unserialize_one(struct luo_session *session,
+					struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
+	luo_file_unfreeze(&session->file_set);
+	memset(ser, 0, sizeof(*ser));
 }
 
-static int luo_session_freeze_one(struct luo_session *session,
-				  struct luo_session_ser *ser)
+static int luo_session_serialize_one(struct luo_session *session,
+				     struct luo_session_ser *ser)
 {
+	int err;
+
 	guard(mutex)(&session->mutex);
-	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
+	err = luo_file_freeze(&session->file_set);
+	if (err)
+		return err;
+
+	strscpy(ser->name, session->name, sizeof(ser->name));
+	ser->file_set_ser.count = session->file_set.count;
+	ser->file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	return 0;
 }
 
 static int luo_session_release(struct inode *inodep, struct file *filep)
@@ -656,13 +668,11 @@ int luo_session_serialize(void)
 			goto err_undo;
 		}
 
-		err = luo_session_freeze_one(session, ser);
+		err = luo_session_serialize_one(session, ser);
 		if (err) {
 			kho_block_set_it_prev(&it);
 			goto err_undo;
 		}
-
-		strscpy(ser->name, session->name, sizeof(ser->name));
 	}
 
 	if (sh->count > 0)
@@ -675,8 +685,7 @@ int luo_session_serialize(void)
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
 		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
 
-		luo_session_unfreeze_one(session, ser);
-		memset(ser->name, 0, sizeof(ser->name));
+		luo_session_unserialize_one(session, ser);
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.56.0.307.g5fe7bd680c-goog

