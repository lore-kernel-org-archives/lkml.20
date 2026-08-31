Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF54570EC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196932; cv=none; b=eGsU6hytn+yi1OdCZpxJj1Ay9EuCZnHve2jfuAXTA9DJqohVpaeVcC4i/A2QTF6SPoxFDK71gXl7FTB863JsiB8LI6VBZtDJ3VA2c4KmjHSesp28d7Mw89YEg4ZdR+cW1D/4SnxNOm3p79rhIYt0QzRBbA010HnGuBFxUo85Rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196932; c=relaxed/simple;
	bh=3wB4bhyF3dA1bh9xcN6iss5ZuHBIuPUsoPXwm+CSnvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rpQ/05eqstHWH3guMxYP+4boAhweZ1ju76r50AL0yUKHYAqIAExH3lYKqxIKlIFim1iq8eGn0HnHL4WSKrsDgNMDeABRRlwZ87WCLdPcp8oitcTWudd9XHpJUN2F3NIWt0qDMeWd37RwBeEN93kwMKidkgBFp9ouGxqALTOpXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqzB68yq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqzB68yq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so5571776a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196930; x=1788801730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9FyKBZk/71rvgbCJsBivicwYPHK0A7JeoLDX92n63Y=;
        b=SqzB68yqJGLAXwKuSIPqfvOX2TWqMQuTP3fd/HcC1Ci2s6F7mmX+kvhwDZonyLfJb+
         HMRGfV2SDh4y7EGFaeZosfb6Ugq8+8B5embtibnOb+SBdDHUIh5IIRUiAAzAFUhFjnWz
         lZ/ui2lRC1ppNkaRFoj4zpfB96g85H/jng6rkn+bnZaRUos6voV8PeAAVxPU+2vfOKCq
         NBcGR56lozV1DAQHafWqrTaSXgQKuXUx7VHiQURLzR/oBoWqMp2H9C35c1W76emVNeux
         SKQ3/lMRtvXIS09tehyQ5lQFY0WrQ7GmR5E1M+ZjPHON3ORPe8wh9E/E3ecom3sXoSkA
         Polg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196930; x=1788801730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9FyKBZk/71rvgbCJsBivicwYPHK0A7JeoLDX92n63Y=;
        b=PKpwU3bYe4vhUPswwYpNF3nnSvRxiBKmJO+wL24MJ9HXzXh7pF92JBNweC1BIUOVEr
         rVID5CCXBD/sAwoPnmjX9jRtp/vLu4cJmHgkYT6octarwuU9tNFL20/uTiAp6PkrZxWC
         1Tz35F6LNbSB7WXyqnHhsZo8wQ07zseu6Ke1D4BeGGTHNRIn7/lgMRbW/HTMhGouFJdh
         vrOLFSIAnU0t6uiH5QnZ+CypP4sg0+It9F6eiSsbUvzjtyepDxOZyuLV6NNMj/bO5PW4
         gYyVI3Gb53aN8UdHO8TkwrxtREqx+gGq9TTn/ArK5QAZPA8vIG9VAMqu7lUpB+qg4b9y
         /8AA==
X-Forwarded-Encrypted: i=1; AKwUvBwURE1vhMIzj3GkJe2jKH4P/tzRLL0gPtaWccaT6PQuqluuxrEhFQVeIs6iob9++eLn86GEThxPa0FUPgg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldMpr5LmCp47IsEiQwqXy6n5SmiCYLTDqQn/tXOKDBxOJRrTdH
	i20VcTjt8ZQl9mnVV90ClHlhmL+ZSSCjCM6MwBO1ubN8xmDjghVL9tjf
X-Gm-Gg: AYBFou0OeBknZrR0wTE16oAELa0eTeDQAZBrhvzPJnZJrhuv1QUEWdHwc6GMBwxJpDu
	0KH/SfEN3J0XsUrnfsSX8bVYORFdcXfhqiAjyScWjQt1P+wJqf3vdO7nUi81D+rog7mQyCZvQWz
	gR8sqdRmD6xxGQnO4hwNNvk/lIq0yhNj/buZkQB1acZiH3K9JEaUx8fSTKdlAAp/mzZI71/WL6a
	X61xKiCA1LunA+Lp11aqciKhpmywe0wyhtL844zJ/MhtPpzsG9aqK6R0vR9LThISl0EL4kQEHDS
	G0YQ+QjJPuKmBf6A9L+27nIYOioEEolzVB9398OnO3J3pYbwHwemILiE9Epx07Q9/nE4KZBNE7G
	dRT16nWidjgHKeU6G2MU3L/Ba6954Ohvv4Cxgvy8fVhwTPFee073JtLrDpNdExbnWGVoJS9td9N
	pv0SUV7mieTAdeHNOAxUYlCxpvfhYFk2YSjWa/z7HtyXXAaOoOyjOAwU3/0qEe883kS0RPkVXQv
	SJ1R2V3w9a/dcU0t/7n/eghpO+sSouqROIV4dshqvI12mTk/JIar7wgqXNE5sU=
X-Received: by 2002:a17:90b:3903:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39907bbe018mr2704859a91.8.1788196930354;
        Mon, 31 Aug 2026 10:22:10 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm36241012eec.7.2026.08.31.10.22.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 10:22:09 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v8 0/2] i2c: mux: Propagate firmware nodes to channel adapters
Date: Mon, 31 Aug 2026 10:22:05 -0700
Message-ID: <cover.1788181174.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device Tree channel nodes are associated with the adapters created by
i2c-mux, but equivalent firmware-node descriptions are not. Convert the
existing lookup to generic firmware-node operations so software-node and
ACPI descriptions can use the same property traversal.

This is the remaining I2C prerequisite split out of the Time Card series.
The channel-node leak fix from v7 was applied to i2c-next as commit
385c7af4e3b9 ("i2c: mux: Fix channel node leak on adapter add failure"), so
it is no longer included here. The first patch factors the Device Tree
lookup into a helper without changing behavior. The second converts the
helper and node lifetime handling to generic firmware-node operations.

The existing acpi_preset_companion() call remains in place after the generic
lookup. A separate reference to the node returned by that lookup is retained
because ACPI companion setup may replace the adapter's primary firmware
node. The dependent ptp_ocp board profiles will be resent to net-next after
the LED and I2C prerequisites land.

Changes since v7:
  - Drop the channel-node leak fix now present in i2c-next.
  - Rebase onto the current i2c-next branch.
  - Remove the firmware-node type restriction so ACPI firmware nodes also
    use the generic lookup, as discussed with Peter Rosin and Andy
    Shevchenko.
  - Retain the existing acpi_preset_companion() path.
  - Keep a separate reference to the generic lookup result in case ACPI
    companion setup replaces the adapter's primary firmware node.
  - Return arbitrator and gate nodes directly from the lookup helper, as
    suggested by Peter.
  - Describe the conversion as firmware-node propagation.

Validation:
  - git diff --check
  - strict checkpatch with an 80-column limit
  - x86-64 GCC W=1 object build of drivers/i2c/i2c-mux.o
  - mailbox replay onto the declared base with an identical resulting tree

v7: https://lore.kernel.org/r/cover.1787502619.git.ahmadexp@gmail.com/

Ahmad Byagowi (2):
  i2c: mux: Factor out channel node lookup
  i2c: mux: Propagate firmware nodes to channel adapters

 drivers/i2c/i2c-mux.c | 96 ++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 46 deletions(-)


base-commit: 1f3e66348d2527c31b9bedb0b4d9e28bdad9bc83
-- 
2.50.1 (Apple Git-155)
