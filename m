Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436492;
	b=CP0gCzgHPCXJCd9n+66DtwsVMPb4hvl8lCJxa/jpHS/ITf9G98MgiA9ldURhuRTgnz5b
	 8xpnYw9A3JGwzhVgj9j7tM5+zdnciRE5Wr1NGWP9jQq5gww4GWgWk5ZpL5/Y+px87TYmm
	 xASQT69ho149VSAt2cShoflns9yp6tyWOshPPRvzwx53qn8rOrdeg70PYvdA9jVIGg6BK
	 ohToesaHZlbxo6mKtCVer5nkPdH5W4uqgxJRkpZiuPTZVc6ucj5blZKXJNccXWXV3VcUn
	 REmnEqD0/htH+dKZjr40Dm5NXsuHLZUiGNUGPZjwYAa5M71vdSYuvbgAKxaC2RGkAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
	b=r511rP6ZmtzMrb8cpYNr/TQVVz39gyLrHb4j970BzM7LJnN/nO4ZK3idecC+u0t6qtnF
	 2Ho62sENs5j1/GYxLGtxt6aZaDmiXVgZxVl4XATGdDWGsGJqden8TnfLWqUPqUWZvaco2
	 Mdxot5380bvFVyuekhOZgPgQ5wIwcwqwfMasa+ntr8A6I5kQL02KPs4/su+ES/or3942l
	 LNCFyQ5gMGA1YYBFxgT1SFCDgbI/bbiUDJO8FCblNLqsUoXhz+EjRpdXSL5X+sCxz/tPd
	 0V8dYK1TsUAYIL+LeAnpCH26sBFdBh3PORUaPrxQKKwTY9Q+COhjA15/+ftzLlB8bKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919E606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A919E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9995ce866so18322815ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436491; x=1793041291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=cRYpaBTMVC7XVXSau9iQnNb982otn5J294NaNijuz0X4dHP9n0KRgvYCrOplTS5aBb
         QNtAHSxHVdqETcgFENkX00iuJS60yVQO36lr6lyNUs5Ej+Qd7WqPb8JUoXieKTCCu/1R
         qJufzAwS5wu0jOzMVbtHU+oqZexlZf/2UYxKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436491; x=1793041291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=TygwU+MIR6QcGT7p3gs+gp5KX/utO6fZd6cM2mx05nOZ7SN6VrJnceR0rEaUcWYYxc
         aZTyil3hnCKFAwCr4o0iD/gVxCeuYEswLGfV26yWh1iaHRA6XiIAef3Xl0Cphvzapjf0
         lPvN2OWX83CRSv5eD9WaZGzE5CIXAD316HpR0npSdWYbcBYjU+RvhgDq6UoZ9TX95jTV
         2Ktj7tqfnAJWnpruuZlekU1V7ZG+6qdsfb3bQxfix69yth31xG+YA9drwD2Rb1RfkqhZ
         JDCQe1Z1gRfyZQDiSUZrTjPE3ShEv2RTGhC7A4WIc8YQuPVVECYFGgBwYbGNEb6piFjg
         9rnQ==
X-Forwarded-Encrypted: i=1; AKwUvByyZnHrCwoUqO50KDgUuYnyMsHODG82M3jGJyitVpQm2Rr+JJYVjgJ1PZDwmqfmpibZf5UxPEwxOF4HAmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxbbReSBQDBTmh9UEwfXo1Pa8QyOVV+gyr2fJi4vm0XXxa/xtN
	nve99jO3k9nh9D15JygIGs3iCVoetXWlraVT+i+e6zDSeiKmgCXArpX06/DKsWzJ3A==
X-Gm-Gg: AYBFou3b1P+ri3aTkgyJMhe0p/NqY5m6RdIIRZLnafVJAfWpM0oJalTdVoRwZtHJMPV
	QGzz/k2J7UfatTKqpZ9eXMqi/URYThWx5EzqCNIJknhPMrpgzzxaxDhW3DMo8vUQ5JExQTMtnGp
	Kx+5+eFZUI4DgewBPCXCE+KpBfOmQTQ57bsRPmha7j/INCWGuz74+7Mtl2aI/Rvb4lWXtEGoDNR
	dqGl+uS0annfbWXTv6TtBNaihR5+yD3lanqvaqOdSkYfaYU6EeULx7I6HXxGxbwzwqmWHRRtuQ3
	RMSGcOx+yDkYjcyhJpMA04QM5KD0KxPo3bOtglBVs7hxtt+zu66FWGcsEGyhOTGb4h06nAC1nfa
	rkH/OSZ9sXo7seBhH5UwqXAabrdIPqU0dsU0+rVwR9Wr2J7LWatC5sE4aMq9z48GEW+qbM9D3aB
	LdEVTOiqTRjNl2iwDVQjrKEgLr9Y79+uOqparM8YX4owbCxpiLG7owAgzLZQZkG5zGmjPEyX3Jx
	Us0CvFATJKvFWwNRSEPt/UGvD6IDSL1kImWkJ37HEdkccMXD51XGAIlRz98TgCO0iM6XQDk5R8R
	TSWzbQ==
X-Received: by 2002:a17:903:22c6:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2e9a6d367b9mr71528345ad.61.1792436491064;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:30 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:13 +0000
Subject: [PATCH v6 01/11] Documentation: Correction in HID output_report
 callback description.
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-send-upstream-v6-1-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=3F0PUGRvwtvEKibOIad7sMQuPUN5v644d10H48NGstE=;
 b=oNrr9I9JcmB+rovcLexc52aW/JcbxtVxrpwrTYSTNrVT9zSgQ72OmH3qacvYoupyivVC/2ZPi
 FOYyp9GlaJNCdYZ/PxNSjL5MCAqvSVv1uPmyoBi0jqFRO7HCzmMYTCH
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.212.g129ede20d9-goog

