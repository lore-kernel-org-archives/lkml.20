Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8182C325C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792027736; cv=pass; b=ACDG29XVPO9/y8N1C/9t8hX80p1qfuSGptJSclpQfewaigXW40OKNppLhebzliSCvJ1SU1UH8ge95d6k6mpwJv4Vbynb5dv+g1nnGHfMVMJq/HfA2ZSMN4vEkhwrmEF7dcL0ucpTN8RsT4hBhn6jpOZQrqlVqKLqihonVvCabBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792027736; c=relaxed/simple;
	bh=dnx6g/9ixM5NFJDISuWjAeW3ycDShCzXPusFIgWOxcs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=hXAEDAyDECnWnjdcDo9/fyj4hhKiCkNHuuksFKGMFGdWw5lryE7u4RTM+HyQzaHhs7Ox5YoPgQdQCy6NOYo/qYPEao1yTtWmIbjQW+iq+cZ+p8bugB4+lEaAAgeddcEjUx1TE4Qtp/AgLVWhvGx48TJ0T3g3anc5/oPKl9YRROo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=FZPzoDiu reason="key not found in DNS"; arc=pass smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="FZPzoDiu"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-82389e65a09so851992a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792027734; cv=none;
        d=google.com; s=arc-20260327;
        b=ODqkxn2qML14VNiIe503VAHGPJtLowqPhL2HfPM38FLCa+lvW++4WQaS/p7fEh3Tku
         PJZbYD+7nJekqAlSiWO+xZl0TUhqFyr/mQPi84gZ7mB5MqH+7eGt4VXkChkPN47dRChg
         z+AbnoqjW0JvjsTii9he6Ezc/IJjk1C/9LAn29yjoWppawCx5lh4IdPOIc7INqICgPzR
         bD0rllGgKEOxf2D/+7WLHp6ww+XydENFRjh8LBTyeOgCdGS99d190ADXRiiy3BnmgVeY
         TQAFOmfvb1r7DB9zsvpORzQiPjKl9UNVfuLLu5tbjHwyHNvEb6KPQ8lWjl4udWoIegVG
         vEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Q5uVuvTWXajEdN6wZPxpoBw0tWfNu44FcU1kEUeI9h8=;
        fh=K5xR3RDerYHkLs4V+A+tVn8xwMB8glaF/JiRhgRQvq0=;
        b=qUKyIsJjWz98GG8UezjE3A6o54vvBQMfogotuzXIMIg/0YVjjnPfcBa1DHuyxbde5l
         BQjRCJDttW24gMbPO95FlJ+w3PIHufFFWxmCm6ftvgdPTH1zn5V0rPEWFtKyS/RCTWGE
         SukXE/WFvOoz1vdKX+6d86OisBIsI//YAWctskqeqG+eRPXznh6i/ay710lBNnu08gcs
         Pm0Arif8fKNu9P9NdEm1IsZPnTPRk75YYM3U1CEr8evbVsiwvnTA6IV5vRq1SKRZUlnS
         j7bZdT7GihBcLguKw5XqLTskJ0uEZGdeCZ7vkM9cGXxhYCeVAPXW0ADjg+2NmX7MOycu
         woRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792027734; x=1792632534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5uVuvTWXajEdN6wZPxpoBw0tWfNu44FcU1kEUeI9h8=;
        b=FZPzoDiu9EX4STMlOxNWrgBC9SatwDBCt9Dp4/GpKTjFzcZEcHNKXw9fMjw7qAsy6z
         2BJ7FWjCTun1Q8G2Kz7ZL2LqNAttLi9sInSh3+9trBmGRTPD8oWiQ3Fh84nTM9Jj5miT
         naBrMDWLeV0vAmyPyL3kDKvPA07RwJTPVfFr3AzMu8p2MW9AA1RkfYqMvaJuRfTBzmLK
         VhE76s1+65jOobQ9nNMR9yxHSURlPK793NbfIvF47841gIyg6TFjVXrzXBHdO+flk27q
         TcpLKKuvN3EbJ82cG8CXnK4l5sveiwN7VHoConqtQnQQpe3GU76UufmSumwabuAJPD12
         v8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027734; x=1792632534;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q5uVuvTWXajEdN6wZPxpoBw0tWfNu44FcU1kEUeI9h8=;
        b=TzHof1I9DXMrhaKBLuZUZ4KHP67BCgMw/lgf/tMKipC2hpnECU6MUoBz0uvASOTfZr
         24kSPqd5kAKbBzcxp4JySYA8hhJzstptPXWPbiFl4PZLyAK3HpgcLYKp1gOvFkOen8I0
         DCiJiDMg8K9RcFEOqWeGeY7UBTuRX2QPr6GUuFNxs9L3YEUud1sFL0tyxDpaka3gyi/x
         4MFe5rB1icZ3z+S8qAGnXf5if4p854Il7ldql273yMEUEnDanYbSuLzmX3nAyiPu5e2l
         pPZQbu4wJJzO/22ktgKFav1UZgjl5YZWwS2SQfvJVp1y1myUtytOzveZb9udltA1V6ma
         z43w==
X-Forwarded-Encrypted: i=1; AKwUvBwY+TuW1OCkAVZftPzliJTKinmQBYynqtAI/Ce69frWwenUM8+bw6pAnJek3+Li3PWBw2yTQreY/2oPd/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKze89nBSd17KaiuU/7W30+M70Bd83ldLzkd5yPa3bJRhFfdrE1
	HkKg4hXMBfhRkqpAN4PZibJjXeNVOckoelYFbfuUky3BkLnOpuz2ETXmYbol6/yTGO7jvW4Js4h
	JtKKFKW89rruRopo4h8u7+d0htkAaKEvZNZly0TraPw==
X-Gm-Gg: AYBFou2YU3jgBmuF73Th0eb8TBd6z9iPCVkHYqUI7bdHoQyYIHUHwjLBlrMuaBMShaz
	z41UOxMABWGVHgzgQkjS6TkKYXdnfsjJMk7fIb0tMX/c9DAIMAEZgN2SOT29jndUOr9X0DPmWKx
	0OrwDq2ssDsQK4VYZJEs5zQruy+DWYgFyPhTtgFg5Ilvi4lek0sxADVG9S+hbNo32tCUSUtgeKc
	7P5SAHRKM+SSErBgw6IT3OGvdjlMmYgGzgZQzm5xreowsFrJIYBWKuySM+R8p0sMpicAI3Xlfsk
	OVCzk875+7mZ3VuFTJX7Nx5eRkb6RR2kWK2n3A5ddaxg3/fHZR6ttON0zgdmL1+ZWO6E74zAlTP
	jh7QIze6esDHMFZpuhdkyxrw=
X-Received: by 2002:a05:6808:148f:b0:4d5:27da:a494 with SMTP id
 5614622812f47-50c54d0702fmr16047927b6e.46.1792027733598; Wed, 14 Oct 2026
 18:28:53 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 21:28:53 -0400
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 21:28:53 -0400
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 21:28:53 -0400
X-Gm-Features: AclHuK-P7Ehq46s_2_6B_7t-fPVdAN2KoxDEtkusBHHCqXfchF4D5I86ViwzGGU
Message-ID: <CAOx7e9+Vv8Pdyks=AbE5XG0ZyDgtKToKyBLTnt+H5RPn6VymVg@mail.gmail.com>
Subject: [PATCH] ACPICA: Fix parse tree memory leak on AML execution error unwind
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: Robert Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"

acpi_ps_complete_this_op() decides whether to defer deletion of an
AML_CLASS_ARGUMENT parse object to its enclosing parent by checking
walk_state->op_info->class instead of the opcode class of the op being
completed.

When acpi_ps_complete_op() or acpi_ps_complete_final_op() unwinds open
parser scopes on AE_CTRL_TERMINATE or an execution error (such as
AE_NOT_FOUND when resolving a missing symbol inside a control method),
it pops each enclosing parent op and passes it to
acpi_ps_complete_this_op() while walk_state->op_info still points to the
last child op that failed. If that failing child op was of class
AML_CLASS_ARGUMENT (for example, AML_INT_NAMEPATH_OP when
acpi_ps_get_arguments() fails to resolve a method call or predicate
operand), acpi_ps_complete_this_op() sees AML_CLASS_ARGUMENT for every
popped parent op and returns AE_OK early without deleting any of the
enclosing parent subtrees.

For nested control methods invoked via acpi_ds_call_control_method(),
the walk state is initialized with root_op = NULL, so top-level ops in
the called method (such as AML_IF_OP) have op->common.parent == NULL
and are never attached to a root scope op. Skipping
acpi_ps_delete_parse_tree() during error unwind leaks the entire parse
subtree (both Acpi-ParseExt and Acpi-Parse objects, the latter merged
by SLUB into the 80-byte Acpi-State kmem_cache on 64-bit kernels) on
every failed GPE or method evaluation.

Look up the opcode info of op->common.aml_opcode directly in
acpi_ps_complete_this_op() and only defer deletion of
AML_CLASS_ARGUMENT ops when op->common.parent is non-NULL, without
mutating walk_state->opcode during error unwind (which acpi_ps_parse_loop()
still inspects when skipping failed module-level scopes). Remove the
now-redundant acpi_ps_delete_parse_tree(*op) inside the AML_REGION_OP /
AML_DATA_REGION_OP error block in acpi_ps_complete_op(), which previously
worked around this bug only for region ops and caused a double-free when
region creation failed on a non-argument child op. Also use
acpi_ut_delete_generic_state() instead of ACPI_FREE() when draining
walk_state->control_state in acpi_ps_parse_loop().

Fixes: 5088814a6e93 ("ACPICA: AML parser: attempt to continue loading
table after error")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221241
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
 drivers/acpi/acpica/psloop.c   | 5 +++--
 drivers/acpi/acpica/psobject.c | 1 -
 drivers/acpi/acpica/psparse.c  | 7 +++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/acpica/psloop.c b/drivers/acpi/acpica/psloop.c
index 24a57f971c96..0b672a531907 100644
--- a/drivers/acpi/acpica/psloop.c
+++ b/drivers/acpi/acpica/psloop.c
@@ -464,8 +464,9 @@ acpi_status acpi_ps_parse_loop(struct
acpi_walk_state *walk_state)
 						walk_state->aml =
 						    parser_state->aml;
 					}
-					ACPI_FREE(acpi_ut_pop_generic_state
-						  (&walk_state->control_state));
+					acpi_ut_delete_generic_state
+					    (acpi_ut_pop_generic_state
+					     (&walk_state->control_state));
 				}
 				op = NULL;
 				continue;
diff --git a/drivers/acpi/acpica/psobject.c b/drivers/acpi/acpica/psobject.c
index 629cafab1930..f1425b98087b 100644
--- a/drivers/acpi/acpica/psobject.c
+++ b/drivers/acpi/acpica/psobject.c
@@ -559,7 +559,6 @@ acpi_ps_complete_op(struct acpi_walk_state *walk_state,
 								node);
 					acpi_ns_remove_node((*op)->common.node);
 					(*op)->common.node = NULL;
-					acpi_ps_delete_parse_tree(*op);
 				}

 				status2 =
diff --git a/drivers/acpi/acpica/psparse.c b/drivers/acpi/acpica/psparse.c
index 42ec8abef626..b5110d43ab7a 100644
--- a/drivers/acpi/acpica/psparse.c
+++ b/drivers/acpi/acpica/psparse.c
@@ -108,6 +108,7 @@ acpi_ps_complete_this_op(struct acpi_walk_state *walk_state,
 {
 	union acpi_parse_object *prev;
 	union acpi_parse_object *next;
+	const struct acpi_opcode_info *op_info;
 	const struct acpi_opcode_info *parent_info;
 	union acpi_parse_object *replacement_op = NULL;
 	acpi_status status = AE_OK;
@@ -124,9 +125,11 @@ acpi_ps_complete_this_op(struct acpi_walk_state
*walk_state,

 	/* Delete this op and the subtree below it if asked to */

+	op_info = acpi_ps_get_opcode_info(op->common.aml_opcode);
 	if (((walk_state->parse_flags & ACPI_PARSE_TREE_MASK) !=
-	     ACPI_PARSE_DELETE_TREE)
-	    || (walk_state->op_info->class == AML_CLASS_ARGUMENT)) {
+	     ACPI_PARSE_DELETE_TREE) ||
+	    ((op_info->class == AML_CLASS_ARGUMENT) &&
+	     op->common.parent)) {
 		return_ACPI_STATUS(AE_OK);
 	}

-- 
2.56.0
