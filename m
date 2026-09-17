Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875C4E9C30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677915; cv=none; b=E9WBMxMBM4aDMhwv1QwDozThLoPp0ilO8uMX1jFScFo2DBrC4wsBHqJqv6qQzZIfAZdsoNvkmcVoX7FgF7/QrDZyh7GQg/1nBB4ZSm86+s8189VvesuTKVHjtR7EO+uqBJuKvq1V5xPmm6YEnN59VoRxnipxrA+yCENFyfKfsZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677915; c=relaxed/simple;
	bh=3xlog7W6+Eb7uaognsijeu++wSjtW/1ijfNh02cWLeM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FaUA/xNpUGoX4JpQKxTQxCpXUj9hDZ96CEJPJslHDR4xSfhT0DLderQFQ4DSrUYhEYAvO0G7/yU4Ez3YdnbbFAyyEGifwmyy4/fTGnVqlAM9nwTKYEt72g+YDop0HoUQl8jBRYNZFsRD5xB8W/ekSnJ5Ss2JMSXxKoXZzHwx2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=clTozH0R; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="clTozH0R"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so890355ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789677910; x=1790282710; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWbGWX7ba0RN8OdLexXyHstVRWEHpkbx670qUQ+b2/Y=;
        b=clTozH0RI9OcJ4tb1hTm8y7J/empplmvyXkRqHdJCGnpSRUpwxTWaXjMTkyrAShSUn
         PGQOzurkMXCH305nqeQnbXgsWPHY72IkU+v1sL0//WK4hmhI8XVGZ9RtqgTpYW8p7nOX
         BO7vJOGu92o7G3AZXzZynvrpF787UVtbk3t/9pbGnANMShdrLnuerB02/x5mqdPiT93P
         0lJKt9gJ4dUQo0XZGl6G2mWTJdoJckeaJb2AcTqam/ZmtvbOIXhgQgp6fzE3cj1F1laX
         JnDgg1nsbiN6XX5b6fWb7Qe/wUrtJ6dCdO8Ww2cvZhF4cQ7TZjUE/TcudC+XaRSkVD8a
         kTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677910; x=1790282710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWbGWX7ba0RN8OdLexXyHstVRWEHpkbx670qUQ+b2/Y=;
        b=MegE7XDRbWnAvK/cX8t6dT1eZlwuIQ30kQ+BgXcBSnGnBYnrm4g0wlLN3UvjLgd/S6
         SRSSs3ZTXklT9TUA94C9hXrCPbTlgz4wWLhf4JwJSKrcJfCdl30YyScRC1Ua/SZHgUU1
         QMQB0evbn6U/uZI8Z0sHhP5KqeUYXmsvdg62PhqIOS6/tMoiaA0hFYkE/8q8AXTG+YoW
         4g76y6KpM6KPCeYpMt2fG0njSE94od6kny10jeKFbtXmkWCKK8780qw7vjaJKwtavfPC
         cltx2vi0uLm8i8KXhm4YjrH77F6Mgi4PsRj9X57ySmb+w/28KIuQU3g69VrJ9NmNcTYs
         Ktyw==
X-Forwarded-Encrypted: i=1; AKwUvBwIznL+sLPL5W3o+IeedvfI4icQOmt9ZipPJMRzqmcMFf/GbnmqZw+YeNYHRJLXHluVL2gyTC5fxIDFjJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kKZ/4bYqqij4E/IwiWJYQ0GRbbdpLBa3ke3DPjeHfNuqN30tHp
	C9JxMXoGWd4zMEy166Wykni4u3ScMxOWxRC5FPOoAfYTLOvuyDx4V5lVzZElAV1K6MjsQVrqYi3
	8Tm/Gsg==
X-Received: from plml16.prod.google.com ([2002:a17:903:1850:b0:2db:78a3:f716])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32c6:b0:2dd:ad74:ac29
 with SMTP id d9443c01a7336-2ddb1bae2b9mr6705575ad.27.1789677910414; Thu, 17
 Sep 2026 13:45:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 20:43:49 +0000
In-Reply-To: <20260917-memory-failure-mf-delayed-fix-v6-0-4b00856b5364@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917-memory-failure-mf-delayed-fix-v6-0-4b00856b5364@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789677906; l=1749;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=3xlog7W6+Eb7uaognsijeu++wSjtW/1ijfNh02cWLeM=; b=mnhxUqOuObNj+R5apFx/dutD/hRRG/ythFNvIOI5goZLBTNWbCm8BcyPLsM2Vszxyyckiwnet
 SZYrzREtHi+DHtWpEun46A6CGi7NLx95gjCXlHx8OcmRZ0VdUKFkwcO
X-Mailer: b4 0.14.3
Message-ID: <20260917-memory-failure-mf-delayed-fix-v6-3-4b00856b5364@google.com>
Subject: [PATCH v6 3/5] mm: shmem: Update shmem handler to the MF_DELAYED definition
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, 
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Rik van Riel <riel@redhat.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

To align with the definition of MF_DELAYED, update
shmem_error_remove_folio() to return MF_DELAYED.

shmem handles memory failures but defers the actual file truncation. The
function's return value should therefore be MF_DELAYED to accurately
reflect the state.

Currently, this logical error does not cause a bug, because:

- For shmem folios, folio->private is not set.
- As a result, filemap_release_folio() is a no-op and returns true.
- This, in turn, causes truncate_error_folio() to incorrectly return
  MF_RECOVERED.
- The caller then treats MF_RECOVERED as a success condition, masking the
  issue.

The previous patch relays MF_DELAYED to the caller of
truncate_error_folio() before any logging, so returning MF_DELAYED from
shmem_error_remove_folio() will retain the original behavior of not
adding any logs.

The return value of truncate_error_folio() is consumed in action_result(),
which treats MF_DELAYED the same way as MF_RECOVERED, hence action_result()
also returns the same thing after this change.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 774f4b18ff5c..d6f94786e709 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5136,7 +5136,7 @@ static void __init shmem_destroy_inodecache(void)
 static int shmem_error_remove_folio(struct address_space *mapping,
 				   struct folio *folio)
 {
-	return 0;
+	return MF_DELAYED;
 }
 
 static const struct address_space_operations shmem_aops = {

-- 
2.55.0.1082.g2b9226bbc0-goog

