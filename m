Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471758;
	b=VUrh96+uswtDXOra79DZoF+eQGDFi9mHm3uYaHg5nakkiEL+Y/WQVy8pldZTn3CdXFww
	 3EsseqorgyTI+cxAh1kwiXV+IJnh1cpVxxUY3b1d6IbJglsEBtXKQuQvBU7iqr6GRcI2I
	 fdzUfJ5FkTI95IYwlwnaD7OQFxpXVhz99h1QBibkl0QUNyPU0qqth1G9OysE7JB48/LQ6
	 KUn0zMXEGXBcdcUVp+2h/rSvyFWadaFRIFaGAWW7aShmZsE1jgQoRMborUd6ULXEKnrmY
	 kK/70Q47B75z72G3OXuod4b0rBELdV75CKQWZGaw7MZgshTpPcOe+e9J/1eiQNYlEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ScNzawShXKrGXlogOPyfxSlb2G6dZe7SaUn4tH+A76o=;
	b=NeIGBTockQRx3R7gJ7h/2w82IVsjw3VZ6CzJDqOzO+9IeEHoQ8jVpL2NXO9WSoxag6DB
	 5wIrQ9PQAy5wowtAE0FdC9SK/cxiJ05Qrljcz3KvpKzlMW3y8RRVQOj5CGFj7doxxil/b
	 feMsVNP8uQPCI9PEyA77mnom6U+oROCb5QnXC8a5kSo6EfJKVkmYTr6MgPxDAUiWBSxNf
	 e0VI26wrExsEDgsmA9LIi26XphsRBIdjA6FYAlur2dO6fM7ZQl8iFTrbBFAtbiTrW0gTM
	 N82rtSgGclewoZ4Kw7tK5S0VLji9qfo4rym9Pc81A1eZsdZKkNCN9t8amRtCq1L75+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBvdOo+n;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 229E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBvdOo+n
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10141265e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471755; x=1794076555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScNzawShXKrGXlogOPyfxSlb2G6dZe7SaUn4tH+A76o=;
        b=mBvdOo+n8cXHG28ipFe+13Gso+AWyV/hRigrGb5kWoswYk5R67XD/07LHKNsBoZXcB
         ow/YP6wVyfX0CjWwoFCxxirB44LWlwuzl+mye077n1u82LSfgKsR8KLtqZ9F3CZ0wbc8
         oK1f2rX/jSfzhVle1MjR/gSgN5Qhi9N5rgN278fwMsGgsIQhwpFOqLT6Kc5jFS6YEiEj
         fjGftOuE2z+FZKUfU41RU7lexSlWb7yz/nTuNsm8EHf3dj9FgKNRiUsxtoPrt41K5WPC
         6rUbaSOjGKgTv8D3J6FVwxRJnNzRn0ywh7EaR6SLmmT5p0vB87q55GAO/WQq94MyBBoX
         9Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471755; x=1794076555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScNzawShXKrGXlogOPyfxSlb2G6dZe7SaUn4tH+A76o=;
        b=HYRIq6o4qG9fh+IdGUiKok49689dv7O1nwFFYHDBfPMzl6fFzwwCXv//5DjfiMwd/j
         vVafw4GSc8l6JWf5jiHVncLwlpHoHdsv9JO4SeIPJwXaFpLlCWQjACBzhG6ZW4zP8Fxe
         CrzqovaKLMpOnyNTydxUJm30kz4G7CEXR0BrzBrfTNUx/PavXjHYeevsEbBh2FOVPjs8
         ecYQHbNw2YOp9OsFa6bGNHkf3yRWJmspWgkOr+PLrfshHQROD+K/asCy5/dI+DSQ/Ox4
         nDQx7CKJ834Srw0QqsEgJh2ug7Fy+/v5QduUl2mf0NQvqQP+6raF3LuOOD3rL1zYBx1R
         YFBg==
X-Forwarded-Encrypted: i=1; AKwUvBylsHyx4AdJ6LjzN5TscWFI267xn64/34KQ+Nkt6n9m+b4AAFeh+PrpJquIK/L5VyDqAbgbxtgvkLhiLcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlH/jfE51dZKpEIJt+aFzEnvpn2nwG9Upf3idPE4lacGS+/tKV
	UZqjC8oKNM8XO/KnceuVNARdvKWE20ZcvGyKvXNod8/C+kRfAlZid+7H
X-Gm-Gg: AYBFou3m63Y8+MddYfT6ThNk4KlOcAluDv3dT0oCr2RPAoqiFb0Bes3aurTmz4UMCfp
	Qsyx6ilv7+WUY/ojtMFaqyTPbKkAyJvbIJ+cwOGh9eB2/yb/gWiV3IoAqCNbHqW2cdr5Y9B9Hpb
	oJjVGb6z3b4rRI6rZ+/QtcgUFQsmUG6e5gzvOZXmne1/6fS8+2fTGzceRZAwGJVGyoeFervgiep
	9pN7PcwOXjB77NRL42UDJ30uQl6C5uCpmKdtP57KwIVmgv7yC7R/EcaLHiXVnp9UQMXVjBeeTjo
	iXax9cmYZx+ydrmTSQuxsGpqqNBIgD9nQyzWiEUMDXv3fub3+9OGJqWLOdTwu7eimVmbykToKPd
	D1YL6T8deqD1FfoX+CmMVNSnB8ELIrHjz/y6uLRhmLirC4RnpwatOTQ2rNKXwEjB9tjjy3D/pPS
	6z2N6/PYXVCrvMgnjPuBrVqBkI+WXmfDVxqSOgBLR8vogcHZCHDRjSumxDt63p52nMkGeNkiy8o
	FLAjr9B+Erxr5e+P+4H6R1Z6iJPMvWUXASvMtvodJzMhl0reo0cUZ9Wlo37/2BuiNjv6GEx07lT
	LajLcbcZhz6qmMEnnXesn2Y9iyC1MyUk7glpZrR0Mjb0bGluBxkfbmW6oksxQOOwZkDkU9hIYGs
	5M9YKs2alNbeFnAJaNQ6y4dR6jjZlNGTdMJsLDi4IBI7Jrnz/wGZtjf9szfu8aR2il7S3j9mjGQ
	TEodHbbXtT5tDnUAohOMVL+OGNYXFDvdxfQ3k3Hf0zqp4x6yTcubxJrN+xNCZUZW0CrlgfIHos3
	Sn3SBlWuSMCSpHg
X-Received: by 2002:a05:600c:524c:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4ac1960dd8dmr133921025e9.30.1793471755505;
        Sat, 31 Oct 2026 11:35:55 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:55 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] tools/bootconfig: Match literal keys in tracing script helpers
Date: Sat, 31 Oct 2026 19:35:34 +0100
Message-ID: <694f66b67c017072c0246997a09e67a79ebee04f.1793471731.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793471731.git.edumucelli@gmail.com>
References: <cover.1793471731.git.edumucelli@gmail.com>
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

The xbc shell helpers interpolate bootconfig keys into regular expressions.
Dots in keys consequently match arbitrary characters: asking for
ftrace.options can also return ftraceXoptions. Branch and subkey lookups
also match unrelated keys that merely share the requested prefix.

Compare complete keys literally and require a dot at descendant boundaries.
Keep the optional subkey pattern operating on the suffix only.

Fixes: 7e66ef0046cc ("tools/bootconfig: Add a script to generate ftrace shell-command from bootconfig")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
The helper checks cover literal dotted keys, missing keys, branch
boundaries and subkey selection. The original helpers passed one of
five checks; the fixed helpers pass all five. These checks also pass
when combined with the other fixes in this series.

 tools/bootconfig/scripts/xbc.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/bootconfig/scripts/xbc.sh b/tools/bootconfig/scripts/xbc.sh
index 1f0ebf50dd2d..16ee590661b4 100644
--- a/tools/bootconfig/scripts/xbc.sh
+++ b/tools/bootconfig/scripts/xbc.sh
@@ -36,21 +36,26 @@ xbc_get_val() { # key [maxnum]
 	if [ "$2" ]; then
 		MAXOPT="-L $2"
 	fi
-	grep "^$1 =" $XBC_TMPFILE | cut -d= -f2- | \
+	awk -v key="$1" '$1 == key && $2 == "="' "$XBC_TMPFILE" | cut -d= -f2- | \
 		sed -e 's/", /" /g' -e "s/',/' /g" | \
 		xargs $MAXOPT -n 1 echo
 }
 
 xbc_has_key() { # key
-	grep -q "^$1 =" $XBC_TMPFILE
+	awk -v key="$1" '$1 == key && $2 == "=" { found = 1 }
+		END { exit !found }' "$XBC_TMPFILE"
 }
 
 xbc_has_branch() { # prefix-key
-	grep -q "^$1" $XBC_TMPFILE
+	awk -v key="$1" '$1 == key || index($1, key ".") == 1 { found = 1 }
+		END { exit !found }' "$XBC_TMPFILE"
 }
 
 xbc_subkeys() { # prefix-key depth [subkey-pattern]
 	__keys=`echo $1 | sed "s/\./ /g"`
 	__s=`nr_args $__keys`
-	grep "^$1$3" $XBC_TMPFILE | cut -d= -f1| cut -d. -f$((__s + 1))-$((__s + $2)) | uniq
+	awk -v key="$1" -v pattern="$3" '
+		index($1, key ".") == 1 &&
+		substr($1, length(key) + 1) ~ ("^" pattern) { print $1 }
+	' "$XBC_TMPFILE" | cut -d. -f$((__s + 1))-$((__s + $2)) | uniq
 }
-- 
2.53.0

