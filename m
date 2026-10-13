Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD7047F3A5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862955; cv=none; b=LeJSsW9nnnQSyb+9GLsMELMuy8K/hhcnVeEKO/kQqhXD//b0JdsbAHF1cIy5YOZhxc6u3GFltZ817DMc4dC0+SNdPNooRhVY885NNyWexTWUg+BpFAgjG0u/uW0PlusB+dvpwQFLFnBS8mHhH17kHFolppt2Rzgj92x6UIAExl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862955; c=relaxed/simple;
	bh=8WHjR6Y3FYP/UdZNsrdNGrWq9ncm7ckzhqHWtFq/KFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8lfQ3497KzlNxh6HfHyWkx86/9gQ1TqQIKgTBBjCyIkD5fDvd7trhPqPDUpILeT+E7SIEzEQZK/13aiujcP2Bsdz01DVDQhu+yv5Z/DN8GiY02Z0lD6ZCtU79YNVhx2D10QTwsawvl4PwswPISRvKPjQ1X+WThHxoZkbqw1ufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNprEhDr; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNprEhDr"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1126692eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862947; x=1792467747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qppf84QoHZGS5TMpFwUMwLIr3ZVPsYBrBYVC6qpryv4=;
        b=WNprEhDrRJMgvlpNGfJKLzPsX6y9yfLpylotdyiuXoqLhhvw9ca2vk0r0h61ZUT0fA
         +6D1u807oDqr7J7LxOmgq3kLc7AQoV1+OgAx7j0IctaA1MAz6Qw7A2KNMcOHGm8fOupJ
         v6gmMgUsttBwEwc9EkgOaZEcd1ePkO7tp+RURWjkxb2HHLBY8ELsJ2UmuKz5Td/yYeJT
         aRcPaQHNheQo0rPne336V6B5QWVPPyFkFQrBNsyJsSXUkqEf2/J4cP/D0mn32p5VGQtP
         kw5bjcFInx2ZiREDHsgh3ZBbQsbO8epbjJe+gSjFloONzp1MgOChNsvyLBAJCT3ANwbj
         1aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862947; x=1792467747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qppf84QoHZGS5TMpFwUMwLIr3ZVPsYBrBYVC6qpryv4=;
        b=fHUWy/oiK9C19CQM92rmoFBfJwTHlKcLgDPQURZBgEjAcomqn8taqBtQ29ONQlwV1o
         OrU8VhqT9nOFJRyZuDapDsOhXjZJdXODf0s69S2f6eobzOeKrJaZSFoIJbH/eHa38g9A
         EctOn9/Z5eX+VxpczjbfvPNrQv5FicA7J4jDiAbdA3ljxUgr/jwu3n7fM9tcocYlC0gv
         zabRtfR8wiBYK4QKt1vzkJJ3rnNPvE0hXQ/BIsO99f7UDOnqdpUDbIMD7qbQCOy9TNUF
         y9kSbyeRSWJtryw6WertoJUQmhayBCQeXVVxs4dCFsSHSA3qu1drglzniZ0jRy4l4B83
         KiaQ==
X-Forwarded-Encrypted: i=1; AKwUvBytVuS5a0Bvz3r6WG861XwzGDjNrw5sserExMdzdkt/GXsQJ757f0souB+7vHxwCVWiqNtE6P6SIP0KJ18=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5k6O5QcIutici0RiunaWmtljMvO6Egye2M6IeXf8vZTWFnumx
	5EpMZLI3a5L8qtCj/g0Bpd87yk1Ixq381KF1St+Fy0vhX3+eAuiylQG5KMnV58PP
X-Gm-Gg: AYBFou1yo/up61yt2w3d7DwtsxMfzmE65ewBEiNKdgJDsA7KMdK5zyOaVCXJwxDJkpG
	0zhXG23Ni7H7i8HPQS/DFK9C7T0PY57p4jkhsEzWsq1OiUz+96kAUBJhckK9xKWJolZVORq8vzS
	HM9agDG026SZr4jxWLL0NfV5JuYEqnafmX6ZLMvXpbKj+TfUlrf2ejscxkOwbIaJzB+5sIc5Cn+
	K0/9/OyseR607JKf5yJ8x82RdZl7TJEUOVe2dPvqybxw77AFtuXthLqjWo3M/O4k9ZvGXUEsS/P
	fe6FkqF8PMB5agf29MxbKBw/YXKIW9ZN01cq1P3TLgiqqxfidvCAGvm3FD8Z1R2dSL0nqVWVTy4
	rRqoRf/rDgdpOA1enofhsaleutp/Vz3k2piyMX0dNGAr00EBj4xXHRDovot+7wezUfc9l4dScG1
	/P+ka3ZAO7ZNmLDZK7gM0eeuMXXUhC/PNGmXM2Y7vR6BCbsg2Y8LKV3YNDuhGNV3G3/IqS+TDgL
	kdN0wNm03eZcxs4JfldQSZP12CZB0UkfYw1z74TAiNo4KF56Ck5zAVaD0YRxyWTkCUgh5//sw==
X-Received: by 2002:a05:7300:fd03:b0:351:4866:255c with SMTP id 5a478bee46e88-3537e058277mr21437793eec.32.1791862946940;
        Mon, 12 Oct 2026 20:42:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:18 -0700
Subject: [PATCH 2/9] HID: core: Fix GET_REPORT input processing for
 unnumbered reports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-2-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

When emulating report retrieval requests in the HID core, low-level
transport drivers store a dummy report ID of 0 at the start of the
buffer for unnumbered reports, with the actual report payload placed
after the initial byte.

Passing the raw transfer buffer and total returned length directly to
the input layer causes unnumbered reports to be processed with an
extraneous leading byte and an incorrect payload length. Offset the
buffer past the leading byte and deduct the dummy report ID from the
length when forwarding unnumbered reports to the input layer.

Fixes: 0d0777ccaa2d ("HID: core: ensure __hid_request reserves the report ID as the first byte")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index ec7c2860c93e..a33e864a25f9 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2033,8 +2033,13 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
 		return ret;
 	}
 
-	if (reqtype == HID_REQ_GET_REPORT)
-		hid_input_report(hid, report->type, buf, ret, 0);
+	if (reqtype == HID_REQ_GET_REPORT) {
+		if (report->id == 0)
+			ret--;
+
+		if (ret > 0)
+			hid_input_report(hid, report->type, data_buf, ret, 0);
+	}
 
 	return 0;
 }

-- 
2.56.0.385.gd3acb90ef8-goog

