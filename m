Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7453C0634
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662100; cv=none; b=sWK+ZZ1zgEFkGwd0j6F1zpYgfHst+2Nwxbjg7Xz8KNQ4cOslwIeK8FtJWazPJdYW9n/31CWrjgSuCjBS0iTrQ6Pz0ILow0V1szpQAGdtQNRYKjJwngdRUh4FF0tJDO6ZqIYN2/LqROaBZ7Hu12QxYqoRYHZg5KzS2XyFYkyCQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662100; c=relaxed/simple;
	bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlaPFNhd7Pg350rVlloBTf6NCj0Km1WD/ii+J009MWo0IX60fj6i++noCy+TeCSfLGhHsNJBVTt1CznPVvJnsTHPK/XsrYYXXqlsIIw/K6gESvl0XEcqYomC88Ck9lYmX3qY9cwBNWDOfageNoeC2RocRmbOzv/WDrqu4VC9/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfF/vB3P; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfF/vB3P"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso2059262f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662096; x=1791266896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=PfF/vB3PsaqBiP0y34Ge1tW8aV6tyaFdRiDCypoQ7+66zw5HsfnJ3eaA2EU2tlrwk1
         JSFas8nIPkhSfbQMy2hPjw67Q5l+5BJRVvHDyNLobk7xceFMcRZcUh9athkHacUUplCS
         nuKWblCHa16mghi5xkwEvbiWfKluuq2g/ni7eykoqOuR7F5nyragm12ZCLg5OXUjuO4M
         2/JIoBip5DwDsNrZxsd4HW9O5e1z0JHFsmpoBZlB88Tv/5aauxFOqIsEHhFG4mDVMNuk
         FQHEa5MM2NM/M0Q7x62iFbPsIE5oYRqf87LbtzhEAGzRHOcokW6sLQLbcrkH9DIPuIUU
         zfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662096; x=1791266896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=NNE2PSuEunNcw70huuH3a27EXnQq7Xy+Oc0a5eNgbpGNWI89Jyt9+2OqPWhsO7DiVg
         WjcjfZnZ1rupUtPZ1N+aO+wlAtkddwSveIpuvh6RctTfct6rTjek/uNG/dwuFcPiZ3KH
         RxXhgYqseayh1SFBYalgNoYEwemj1TEaxV0DGjDjaWcjtncRbYN7cc+HsygDEu1d5lmY
         IGeDaGNJwNjnD/4lD9TR37VGKjkk3o5oVDieXHK/szzbecDP2TQR5eyWqPHHddFd6I/m
         GkSALQutyHNCrzKv3OGU/0wHNqm2dCWdLFemGcD5NINGrTk2J7CFRTWsX+gyU7B1DaOh
         BouA==
X-Forwarded-Encrypted: i=1; AKwUvByeSLe2RpK8YjoqKFne/nRCqHXR0jTSHYGfMPi+J30C76tfaY8aPW4RFvS+1yTi36WtjzqpPQIEpV3EcPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/RAwWs21WPJNkD+Ox14VS0wrIT73t+JMMhEh5+0caFAJD+EGU
	SCEIP0YadDsmJz4eTpQxWpLRqvsDBGy/Lz+CPHtOsJ5OCrU6A+wYYlGf
X-Gm-Gg: AYBFou3Ds2h5xpQAMUxqT8laIWA1o8+lVeiCdqN061UuFLoXlFxkDeBWb1pE3XKm71m
	e2oYIhhnvk+bNE419Yj7k0a9AHWoryHe+iOvs/XBGaYwMSYHfxFbz3thJq5//JNqSmKZ9mFOJRN
	xT+1T37+MC8IXEs5vCFgVPaEvwuGW5cBy5mFec1ookPpwAtRW0SLARk+/pD1YDLIw4T9poQNm5S
	sAUcMlsGCO984QDKdOGoRQPSc5cK7788qCBy8GpKuTC/C87RT+FZjnm//PrUUVkewkQ0NJsWXKN
	ScHhkThHgxVBOcY8MnRPkMzEzMhsjWFzUITObhU+KqttDz70nc25mhg7aw6cAcWOHXl2/eTfVhj
	3n4WK9DL6qcZ67kPbe7//f5m1AvEMt4xhen9KLD0LQR5p1bw8GSx0ZP+uvFSHTFdQl7psq9k6tC
	+9TYxSC7Z+GrwuytTXu5G860pY1jvPjzoSfZs/aLcfvB+e/5MpHfIWlITZ4dN1cETk8E12LyDet
	Unr580Q
X-Received: by 2002:a05:6000:41cb:b0:48a:f511:e40a with SMTP id ffacd0b85a97d-48af511eb10mr783882f8f.34.1790662095984;
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4e8a332sm1628730f8f.0.2026.09.28.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Tue, 29 Sep 2026 09:08:12 +0300
Message-ID: <20260929060812.2041099-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com> <artQxRR3kJUv-mBF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 08:46:45AM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> It would probably be more reliable to just ALIGN() the width and
> height at the start so we don't have to do it over and over again.

Thanks for the review, Dan.

Agreed. I kept this one minimal so it backports cleanly with the Fixes
tag. If the maintainers prefer, I can send a v2 that aligns width and
height once in vdec_try_fmt_common() and derives bytesperline and the
plane sizes from them, or do that as a follow-up cleanup on top.

Michael
