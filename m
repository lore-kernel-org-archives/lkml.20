Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268033;
	b=dlH0FKU+PluGpc6RFyauPTDBcJeUH4N0ghF+ZtA/G62pCFVzJJofR7msRHipzhRvt2ta
	 BLwwSHpBO49h+nEBY4B0Wq/LE1L4vUW1TdfPjBndEzkmq6HdGeUEV55tD/fTwbSz17C+w
	 j+vR/fIqXzoUcoJt6jyN4JAHHAegJj2aBbXYnR9WCAZzVJvNe9EB/i4cGmnIchKepaYgz
	 vrRPr0CRL+xZIiu9sMax00FZWQ6jyyJ7tavyZZhdSblVf40z+se+EwVArMgj22ASyYJeI
	 CvMcn0KPIhC5XAglOO+ZAlRQlsYl4avnofdjMLpDonxXeEUH/5+4WXGzY+UFBnnivHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MuAgzDOGGZNImhzWO720yvkQx63NEyn8l8tBYbjMb5U=;
	b=CgIx3U5ZdkxGJoLrVV+2/hC/eZwzU9Abpq4+kCRy2Q1MzQsF8g23EoZgrphsbObi+8j0
	 mOt7/KKJAfFxQCyNurr1p3ufTY+rRMyas+F7QG/mEXdvSnMDFbe8wwQLU6QH7s4U2cKL2
	 pGtGTLkzDmnz2TAKplyC0myW//Y3wKxSYEVDI3nyEn/gwxafwDp03YmHhe7/MFIzIITSJ
	 f9SpDzcSu4IObCvaiICsGIVCQ3BhET/FOf011THBdd9z8E+wHAng/ZmdKOrsPOz5EvbU+
	 Rr4QFoR0/RT+m9xWnLVVh03HlHwHUFEubK+R8yRXBknEG4ApO8rOBFKmSBWJoJFRjKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JAywMryx;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BA606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JAywMryx
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1482704f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268031; x=1793872831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuAgzDOGGZNImhzWO720yvkQx63NEyn8l8tBYbjMb5U=;
        b=JAywMryxHW1yaysWfWfVQAC0k1C8utwWeeeo1Tt788UbG8ftVXpmVToxy8Ui/PbSt4
         pK69YqTnf+OIdIYPJN6q+/TATtv+wPb6XUkI8stly8vXz1CrpvD99gksZmgxsCBYVYqz
         hFdsofdcvZ0c2pmoxr9P1Z9hah+VlU2mF4/rt3v7tpaUMHAMe2MZTZYJkFUr02gPdD7V
         aQ7hZVvx3k6/irktRxITFy4AwZw3x2yeJiIDDaFrgigLPDmwFNhmysyRzGCT/BTLNr5G
         51KTo/tUIZWi2XvnhbhrsfiiTQ4pHKR/2ywEvKJw8dyctfdL520Sdobp3wjnqgTZRaDz
         1m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268031; x=1793872831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuAgzDOGGZNImhzWO720yvkQx63NEyn8l8tBYbjMb5U=;
        b=e+kkjBmKMVI4nxHDRQyn3wJQ5OdEzN0QOPQAjdsrux+a1gkNooczson5UeH2r1tu09
         dmlSNJ+uVgEN1qNpqfzVRj993RY3fyz9uxGAsFBBACj78Ten+AZWCnG21SICXsboY/EV
         sAk/7jktoIz4QUNRckPcmc+woBIsc7pf6kNo3G0p/D+VpxdDy3o3r9tWh+GFV0qVFYLI
         cD3nSTS2AxoDSuPGSImHJNQDKPh7UeEA4ElOtPvUTL7XqpL00nPpfhl5h3AEXOotrL8g
         r1wgHAI1g+EnbyjyMoej6dVtCK0OvcN3bWMIXcBbn5azqkC0Ljkwmh29KlvRmPeRIzFo
         rJJw==
X-Gm-Message-State: AFq9FYLZEobFCiMIzQ1tdt+5mND1Ip5BQrI5WDadcAytKv6yMscHv06S
	LoIhM7WNJ1gWIjJbV7SLURypftMv2GPZl0ate3AAjOOMS6ju6IoZu8IS
X-Gm-Gg: AYBFou0CE6ziE/yG+QVRCMP1+h9AQOjcF2v2uLp+nrBYS9pNItRNah5MA3NG7QuRvU4
	o11THxapLg/0ViuczUCFJlIw92EP7LJA52IZVIQvoQ28eqPNxlvO11I+NpYO4RS3pqWBHfx38f9
	J28+QR9wng4lQvDHQ3SayodBV3ahaIGnJKd8GNG+lYyUqLrGlkZDCu+ECwGF3grP7MWG4f6omuW
	pRDPD76gcI88dXGGFrTIkXBS8+a+MhqhLcjxtScsrUMFaPSVHfOxS/Cvfdc6cCtA1RhnsBB+JT6
	vv7uLv7lnYeFTRRvpq7mwOwL/Wfxhd85o1NPuA7JupJqmnEw6++xjDNqKdj4DJuKk5EDkXDfH9v
	p/Rbw6YJT9i57lCLRdw2yHGnuDie1k+J9FleUyATYkMijJkGjvRxSnpv7hy3WocG5amGM2Qh5V6
	TPzGHVMf9ehUOaih2AQYWs+/rQ8YIT0wryzfYI9YfHvFt1XAuJ9yqy+K/qV3JlqlubwaXHuzzjB
	X0rnmPA4d0JpfOzXLeejiF39UVa9wXSkesGH9Tf+E8Mh4VyhxhSIA7Jejzp9BPnHZzZQOlZIyNj
	QfGVYW0hyX3ARdyggAwX+bJuztGD6lkI5Z7+HDrV4bE=
X-Received: by 2002:a05:6000:29d7:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-48e6264c7f1mr4314548f8f.14.1793268030946;
        Thu, 29 Oct 2026 03:00:30 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm34025569f8f.9.2026.10.29.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:00:29 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next 0/3] bpf: Add bpf_path_getattr()
Date: Thu, 29 Oct 2026 11:59:49 +0200
Message-ID: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Userspace code can populate BPF maps using file identities obtained from
statx(). BPF LSM programs need a way to generate those inode and device
numbers to look up for those entries. Reading inode fields directly can
give different values on overlayfs and misses filesystem-specific getattr
behavior.

bpf_real_data_inode() resolves the inode hosting a file's data, whose
identity and metadata can differ from those reported by statx() on 
overlayfs. It does not invoke the filesystem's getattr operation or
provide mount information.

This series adds bpf_path_getattr() for sleepable LSM programs. It takes a
trusted path and calls vfs_getattr_nosec() to avoiding calling back into
security_inode_getattr().

The kfunc returns a 64-byte bpf_file_stat. We avoid using struct kstat
directly as this is an internal structure and this can lead to changing
the user API. Inode and device identity follow the filesystem's getattr
operation, and the device number uses stat(2) encoding. Mount IDs,
mount-root attributes and ownership translation follow statx(), including
mount idmapping and translation into the current task's user namespace.

Selftests compare the result with statx() on tmpfs and on overlayfs before
and after copy-up, and exercise verifier restrictions. The series also
updates the relevant documentation.

Anastasios Papagiannis (3):
  bpf: Add bpf_path_getattr()
  docs/bpf: Document bpf_path_getattr()
  selftests/bpf: Test bpf_path_getattr()

 Documentation/bpf/fs_kfuncs.rst               |  13 ++
 fs/bpf_fs_kfuncs.c                            | 108 +++++++++-
 .../selftests/bpf/prog_tests/path_getattr.c   | 185 ++++++++++++++++++
 .../selftests/bpf/progs/path_getattr.c        |  25 +++
 .../bpf/progs/verifier_path_getattr.c         |  57 ++++++
 5 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_path_getattr.c


base-commit: d80373a8e70d3193151232c3062abbbe367ff5ad
-- 
2.56.0

