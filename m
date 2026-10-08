Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7843CEF4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493091; cv=none; b=UXxVb5ZEnUH+4IsMvFaKEqkOXpHC2D0pvUmUXocQh7g3MQVvryufQQH08Y9JoAjltvXcqcieQLLynMDYonZdjqpJtPLVWs6wpNgBeAEH9iS2o1ab6bnV/SwwAeJYAODzkTHbeQYrrB67T/vsgfNhAtr+sus/E/MEQec+jjhSxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493091; c=relaxed/simple;
	bh=vQAwyxNj3AED0ZWDQ7B3q4d5Ag5/7cRBweYxf4EerGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svN6/LCyE2AATAClLpO8y1595TS6nKk7rcAGXs6+KxTlugveXHTFzQIK4+nwOh2JVJX8LruFwxpHT8kOV1TMvE2F/9VsP3yZA7HUsQ0dG6RSY0node3EZCliklz/drq2RlI6ioTYR8oaKgaypMMZOwv40rAt1cpN9Ng6Uk7Iyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=MxrzNy9+; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="MxrzNy9+"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6714595153cso1036890d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791493088; x=1792097888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=MxrzNy9+XPKZgP/QHITHgidKnejBpCbBqpde0Jhs8zaDZ8YVcC0/bmDnKthvi8QN7N
         XA3O6jQt1FITSUNJH1/lcjC5FrPLvMU1GLKEG5KFeSoTg1wFJl7cqPRPvtTJLnjJZTqi
         nVzlADlP+KdoC+dE/CA8m7BBtHxJKE5VAnPEmYfU36WeVhhtTDSWsevHAfI75wPEQ8u0
         mLAiZsDSApZH6fNtaB9NS2/gej1wpXBjHpaGLfA9KZVHWcRUmoBfUnqWJauupHmhmykS
         DKJ7g3T1Hf03AHzIcTFMuRsVtHif8zUYHlF4gRXmUF5H9+7VAUcD/pGLdPIBer445z0L
         uSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493088; x=1792097888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=2Vrrt8MkIg2BvQOxQZrenHJllNxNKgJ8srtHT7xcE/O4qV3YSAhVqSh4jy+zdaQLho
         4Rx4gMRaZss32Of9Cq6RlWn1WSbbc1VQgJFZgqA1HwqDkHUgu/73CnwN8qSqZhGK+2LZ
         IkRXmED7SdU0F2Zyb4jGtYBPK09H6n6rq4TdHAlKbzSS7mr5oljSDlp2HImFJ4boMb/T
         5vQgQ+TTM2r5VcuTNqCOAEjlRqYHz6ireE2NBQaGkf23EzPXiyypO61U9F/1hfiNd83Q
         TM/PED3yISVZfTRayhVjRDCJMrCttjKTCM33eoIjelntV0qImzrbdVoXSP0hsW1S2TOH
         uaCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq24EaiLykI8lmD3X9MbdJ4Kg9L8+ZMkjspc3BmiEHanX0hW1XqJgYLw2l/83/oFGtXsPNWk+ANAHNTTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCn1AkwPu+5d1PshHujPhfh5E+2H1iBM9zDqHuWVSXG+vI9eZc
	LErb9kJQQ+iU2pqC2Bg1yqbsfpbJrS10tWSgm47jX4DQak4KEKYmNX7vq1Mg8LSPNX/T
X-Gm-Gg: AYBFou2YcNVFODf+v4vyegjT+m5QIgvlaXqHo4bVWlF/W2MgYnmt8wvaH2JEfHz4Ygk
	Z771/ZaYvfOry+jsKEYA1NrK6cxvpzS8YweE5BrjwFKtjmUFF+x3S/Y4TQaj3Q6owxMW9MIU8sF
	DVjU1EjDRq+6DGo/ERemfg0c4IWm1gQPC5FwuZsY6GwffBu6OqXyl+jvxommb5CHBvmRWlZfgX8
	fi6dwT9cN0f7UAD8m6AmX3yJ0bcmOAQjPQraH3X2jAwcStRdieoVDmVNItHeb4De+Gn9A6y3efK
	B2rBS9dn6ijUR2jXjXLzJ7k7jKfVYTYeGFMaZ+nGbOy9EvahqoxOHpwB3uLm+uEX/ehhnFK2JhP
	4xc+fImh1uv7qRI7ABDi++F6b0Vbb9Ap3XbA/bXuTZqW+JW7oW9iFnH+U6iOGyzTUw/GNOwSCQW
	u2tXfQE+zg3AG2Mhf8uqntZTtthEDUSlAjog9+MV7KNM7PkvbpWPy0Ut6xHIZSOSifWTyVAFVkC
	xHZFXjhps+iHndxGmri1FlToB4WhCtBmXAKjGM80euilYjoKN04sXY=
X-Received: by 2002:a05:690e:4391:b0:675:6803:98bf with SMTP id 956f58d0204a3-6793628b5b5mr14774d50.45.1791493088070;
        Thu, 08 Oct 2026 13:58:08 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935707401sm78814d50.24.2026.10.08.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:58:07 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Thu, 08 Oct 2026 15:57:37 -0500
Subject: [PATCH bpf-next v2 3/3] Documentation: keys: document IDs added
 since KEY_SPEC_REQKEY_AUTH_KEY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ajhalaney-dmverity-key-identifier-v2-3-008456d189cb@amutable.com>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
In-Reply-To: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.14.3

The table of special key IDs stops at KEY_SPEC_REQKEY_AUTH_KEY.
Fill in all the new ones.

Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 Documentation/security/keys/core.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 326b8a973828..37ed42382f16 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -372,6 +372,19 @@ process making the call::
 	KEY_SPEC_GROUP_KEYRING		-6	GID-specific keyring
 	KEY_SPEC_REQKEY_AUTH_KEY	-7	assumed request_key()
 						  authorisation key
+	KEY_SPEC_REQUESTOR_KEYRING	-8	request_key() destination
+						  keyring
+
+There are also values that refer to a specific kernel keyring rather than to
+anything belonging to the caller.  These keyrings are not linked into any
+keyring, so a search cannot reach them and the ID is the only way to name
+one::
+
+	CONSTANT			VALUE	KEY REFERENCED
+	==============================	======	===========================
+	KEY_SPEC_BPF_KEYRING		-9	the ".bpf" keyring
+	KEY_SPEC_DM_VERITY_KEYRING	-10	the ".dm-verity" keyring
+	KEY_SPEC_FS_VERITY_KEYRING	-11	the ".fs-verity" keyring
 
 
 The main syscalls are:

-- 
2.55.0

