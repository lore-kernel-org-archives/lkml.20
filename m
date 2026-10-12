Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D54F55AC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840560; cv=none; b=ruhIURh4FHyodIo/b7XZgohlqJWCoMb1CRTE2/T1oRsIuWdtXVcUVF8t+TV0M4Cf2whJUQeB2Hh/U34n6Vr0uPm3PoR8K4wQusK/838N3WTJHv/i49ncGR50HV5vwjchvxDIkzbZTBi8iv6PQrPSB88cwpr1g2c8InstaqvpNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840560; c=relaxed/simple;
	bh=aRKMbIGGKLQZB5T9Mq5bX2WoGw64VZBibz5j826Kskg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jvb8JN72IfC5oM63Ymnrm/wvlPGb2Qx8/KJuMmo8GKGMSwFQOwbieppbQKPpk3nTmqSSzBGIUklm00v5c37Juncd1Ik9r1nQOFLG+N4fDxUzTp+dchLaZyMeHO6LYf/A59UfH2lE/XTm76w6OmbFa2ha7Mo9YXh1hcsFOs7QQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiangzp.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmsPW6qS; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiangzp.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmsPW6qS"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so10251767c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791840558; x=1792445358; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Sfy4MAE5xrKVWAYhshU9QLY8Lh9h2prWnQYSdhiJr0=;
        b=rmsPW6qSheNG2A5GXI6Mda2Bi1YWkE1Z5fWcBAeqtWe5Q6kxUOhJtjmjdHtBY7mkzn
         DMuprobZcc1N00EHDVFOPM/Nr+DMBwFX/MMQpA4oXXKJES19wVPqEAg0GH6CP09vFnwO
         EG4eLVGCf5S4tAzV79xj1+XGitfHEcp+tmBEV+wqv6/tPpBQ0Paz8wyH6h+PAySJuZyn
         0CSqM6+5ir960EyQFDaKnOfOmAxUm4jYZ4g7b4fB+1jGFzpgBVy6spC3igC1jShski3S
         vX5/36dnlig2vQhTzV574sGO/y2TLeW+3qdQfmz/aH6KoBF7uKlF4sYnC1lV5cYH2Dae
         YdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840558; x=1792445358;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Sfy4MAE5xrKVWAYhshU9QLY8Lh9h2prWnQYSdhiJr0=;
        b=ZsutOrdfbmaZQ03OdOjo4ePHvCRaJFq9q/acqBwe1ySFZFppJexpFnSB7gZb4Yi25q
         yjS+rxF8hKKn7eHgghefAk0uaDwfvivquCHagA9UwtnbaXkOuKf6ppm1jfWg+Rk4bkhv
         zjrHOyHB1FbwYHNUk6sQ6NVcjWBfZmPw9UObWdIVX5fd+r646aABdeVUZfJ4LoVTYyzw
         zzycMPTtJps87dekepq6BsOVBOjHggZ5lTcY5zFs+hVX0N5MvQAbPRT8Yd8qNTLDHzGB
         vgl3vw9mIiBzPXxNAWvg7FiNJrG230TCCV9FwgDSlCurHcAlCvkizLnoqU5J9lJTeYME
         TYnw==
X-Forwarded-Encrypted: i=1; AKwUvBx6o1uXsTWdh79zdoRw776pvvO4GvjMan37en4AoxZcuFc/Hu0BD/CilOoPOn2yHf2pF3qw5BzwZvODw8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFA2P4vs3t1Z4dvRx6IA9DcgaqV4VisLasfIyDMG9NhX2zWv7R
	Xdb0T2kdcN+seU8aA20r3iluzkLBNHb8bwBNeeXQY/482D3azYjgy01u0u/uLrdQgeRgQYfPPjY
	oAff8I9ImZw==
X-Received: from dlep17-n2.prod.google.com ([2002:a05:701b:4591:20b0:14a:c841:ce30])
 (user=jiangzp job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e11:b0:145:3a5:d918
 with SMTP id a92af1059eb24-16a640fd0admr22091007c88.33.1791840557790; Mon, 12
 Oct 2026 14:29:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:29:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012212902.3491839-1-jiangzp@google.com>
Subject: [PATCH] HID: vivaldi: avoid redundant feature report reads per usage
From: Zhengping Jiang <jiangzp@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
	Archie Pusaka <apusaka@google.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhengping Jiang <jiangzp@google.com>
Content-Type: text/plain; charset="UTF-8"

vivaldi_feature_mapping() is invoked by hidinput_configure_usages() in
ascending usage_index order for each usage in the top-row physical keymap
field. Because fetching the feature report at usage_index == 0 already
reads the entire report from hardware and populates field->value[] for all
usages in the field, calling hid_hw_raw_request() again for subsequent
usages redundantly reads the same report N times (e.g., 12 sequential BLE
GATT reads taking ~2s on Vivaldi BLE keyboards).

Only fetch the feature report from hardware on the first usage
(usage->usage_index == 0) and reuse field->value[usage->usage_index] for
subsequent usages in the field.

Fixes: 33bbe04a15f2 ("HID: google: extract Vivaldi hid feature mapping for use in hid-hammer")
Signed-off-by: Zhengping Jiang <jiangzp@google.com>
---
 drivers/hid/hid-vivaldi-common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
index c3c9fe9e697b..cfee7be4d759 100644
--- a/drivers/hid/hid-vivaldi-common.c
+++ b/drivers/hid/hid-vivaldi-common.c
@@ -49,6 +49,12 @@ void vivaldi_feature_mapping(struct hid_device *hdev,
 	if (fn_key > data->num_function_row_keys)
 		data->num_function_row_keys = fn_key;
 
+	if (usage->usage_index) {
+		data->function_row_physmap[fn_key - MIN_FN_ROW_KEY] =
+			field->value[usage->usage_index];
+		return;
+	}
+
 	report_data = buf = hid_alloc_report_buf(report, GFP_KERNEL);
 	if (!report_data)
 		return;
-- 
2.56.0.385.gd3acb90ef8-goog

