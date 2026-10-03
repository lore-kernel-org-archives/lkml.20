Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABD542BC23
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031930; cv=none; b=g4M41Ws0GcipBSBb7ex09cmHbKlGB/9SR31YNA8sQZ5Gz6rwoypQBAhOmFNZLof5hWpMaWmpGc/kJk+NqOGapnqIITqrSLkQRpOjQkCQNRca3OrPM7Uvr9Vu6Kt2Mx+BV4FM4U7GCgcHQ6H7s6o/shp9qD68Q+Ms9q48wkz/Myo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031930; c=relaxed/simple;
	bh=Ptf6A1n3o14kQDPc7izKJkBkbCPXmLPjKGEOV3e56Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5C+wV+W2CdX/xdOqYROJMSIn3BXlbnOZKDr75r2lKe8XAXKcvwMHE4gAS6rUVIvf7Btk1mZQCn5cNVFyi+9ySM8B27T2wCBfMzbz1uWCgTf9Vf7XJLdasuFKvKR9u8YvpT58oxv8nig08vd+Vfk6nDbEfYKq6OWhoW3uf5EhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCwyJSwO; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCwyJSwO"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-149241d04f5so563788c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791031926; x=1791636726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/KkCnT8DcfgAjdsj7WLPc/noK/t0kZqJiLQcWJITrQ=;
        b=qCwyJSwOj4FB62XbrZghfi1siznFovT5WCWbf+7JZAshi6IOH6bcx3BkllIK/YloQV
         5LeLqdLBX9lk/CCl6eBA3Z2t7w36+XB9RWpdhHrh33laQE5sSVA5xlY8XFW1LqpoHomb
         tyqdgdm87imRiASLF1jI9c099bUG16smHVFQZb2RDlBlpgfz1vgedBJgyNkHm4+KPl+l
         O6vTarziQ3gWPeMBnUj0NIQn8GTBiIEBlsKQ9gXWZlLSP503I4TIo955wWYG256ETV/X
         rKUCbPXBwYXMFsxkedMwT/2E6W4gK9/Nz83Ea7bxTMUi7j9ho4jw7AFOieZpEqMAilck
         Pbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791031926; x=1791636726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/KkCnT8DcfgAjdsj7WLPc/noK/t0kZqJiLQcWJITrQ=;
        b=nU7oLlOuaTkEZ1nfq0NaxPjvzSQmK+feUVE3mWAtU3F0jGJPOANTFa2AlowOVxx6No
         VpmC2ePLJsnnlGrwu1y+CckfOaNPqIFnEX/eIvQaPvh3nNwPiRUBX8lfA5QaZvaunHUr
         mply/iKNEPniB74MGuiwhBVQXIraxnjAOMiV7cu6/AgSyzzdcQ0lVNDFJz4lzGNB0fzs
         YOAkeCyH6yqsRNBYory585GuALxwb1Dj0mS6LK2yaJNziKkLsI0Z2diBmW3VsAYiy70p
         3WC1RT5Qan832PaT3STy5Mckd2obMC3cDiq/Y1RfBvUwcPk1+/6pMs+T0QD2ha30xzk1
         icKQ==
X-Gm-Message-State: AFuF++n5bKmPi1QMqY4Ak2Ir3sEh/e/6LSMlAvCK9uuGAl9lOLqX4zVe
	omvRpu0sQEmKkM6vuWhpgORacTLhe5msJ+AWoywZ0yLPc6Hsd8omZhyI
X-Gm-Gg: AYBFou16xH9h0OcpyZiuWRfWaB5lR1QLXiJZMjNXYl+GTakMM5Q07zOEv93LItGTFRy
	DDZgCMUkmcnvxH+WVcRERWhdNkGPx/Mtp6DkKtJsD/YuaJ4azUedjACvQLw5cRBN6hJRWby35xj
	SsWNo/ZJ5h2jfA9MkbEA0CgNeB2ba9sxtNY6zU8yIiXpVWi+/20tDhNxeGp/QbBfdS9G1HPLj2A
	9Q4L5RRVsaR9hQjIlqfNjzXfcKQe0fEjRb/I5h8cFgGu3tP9yXIzemhc+GuLanJ34zWue4wP160
	QGw4Jq80rc9vSacXTuVEYIoIdtt2u6s8AjcAAduSATPABDUv0ThmF+a+9uZbK826LguIZBh5m/i
	o+GwyJuJcUsRAPgvuVkVsk5/AsPkgap76y/nG78h4lBQ01fubKWuWdd8PE57WcHT5wIkgwfjYRw
	f3uA0nGaya8oK4wmScJrIXYyJI9dzLH1UpdJ5sMis1wOGQmzRRMm5Sc70j4aTt+W4eiOYuBiSSi
	iTizA4Ov8amH64U0hDb
X-Received: by 2002:a05:7022:b057:20b0:14d:38f1:b51a with SMTP id a92af1059eb24-151c32dbd2cmr3274138c88.19.1791031925506;
        Sat, 03 Oct 2026 05:52:05 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm6211515c88.5.2026.10.03.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 05:52:05 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@suse.de
Subject: [PATCH] nvme: auth: validate DHCHAP secret before stopping authentication
Date: Sat,  3 Oct 2026 12:51:15 +0000
Message-ID: <20261003125115.2523-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
References: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hannes,

Yes, I agree that stopping the currently running authentication when the admin requests a new one is intentional.

The issue I was pointing out is slightly different: if the new key is invalid, we never actually get to the point where the new authentication can be started again. "nvme_auth_stop()" has already stopped the existing authentication, and the parser returns an error before the restart path is reached.

So the question is whether writing an invalid replacement key should leave the previous authentication stopped, or whether the key should first be parsed/validated and only then replace the existing authentication state.

If the intended semantics are that an invalid key write should not disturb an already running authentication, then moving the validation before "nvme_auth_stop()" would make the operation effectively transactional:

validate new key
    -> error: leave existing authentication unchanged
    -> success: stop old authentication and start with new key

If, however, the intended semantics are that any attempted replacement stops the existing authentication even when the replacement is invalid, then I agree that the current behaviour is intentional and the patch doesn't fix a bug.

My concern was specifically the former behaviour, rather than "nvme_auth_stop()" itself.

Cheers,
Sreeraj
