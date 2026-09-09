Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA99199FB0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983679; cv=pass; b=iOySJ+ank99QVtNbkpqQA2bDKkgZSjqGSM6U6IezvQNsbDZbF2RGU17XVmC8y5adRxGWmK2+6sEVlNqXh+fNFd8kv8HLtK7+jHSPB17uw1MlLsqRMMhR5LZjVipX61RyvVQmja7gtfyDkf/6+uS81tkXWXvA4HT/XJyUKoTLioc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983679; c=relaxed/simple;
	bh=aKBP1jc6s7Kb9AtFShE/8Kec3yPgLaa7AVvdFtHLVNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbqNODJ+GRF+ccNs/6zuOsbc9kwuHnhOHSE8O8es2BEkcjmx4iib1Yq2CmGV88FInaxfijFWVIx9DtxAUEEwx96E8bBZIDuRMQ/1duv4oUJCktRCRjueaEarSZmyNmnqmVFRmKwbSEohzUSVPo6JMg4LbU6/B1EqVjZeAkR2RCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGaIlqp3; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGaIlqp3"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1566444241.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788983675; cv=none;
        d=google.com; s=arc-20260327;
        b=JKlCvfKnwlhl9aXPZc/6Xa7O8TNq1NldzgsLCgvEuLJ1NDZXuYayfMKVRMAqr7Lfdw
         L29oJgTnmWFJ5+PKHRMoQbuZSUkihObHT6jqf8CSurPrXKstfYS9Ks0YEjnzB/h9plcd
         QsZdt1UVeZRdeUp0a+JKc8rOhbSmXteTzsFwxQ5x2mrxNC3BYjlnNqu1eR7CYpGtcwe1
         ABHkhK1Uc3zuvORbbTFutMAMOVM7khbaUfXWm+jULPQzAqJRmj9yGPxYPUYV3xutGTzo
         O9AxZK0P1BsY9s9oZdCcXBGDZaHHqPKMY8gAuvAb4aUG4J4IcPKoLl+GGhL5asfuyO03
         hpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JlgccNgxVbugZNqdrvfNlhMGvViQkc+NBOA9MC8f2/k=;
        fh=RLOC3DHjrZ3aTpIGZSXq5z/zUzS/TKYz175UXGGxoA8=;
        b=G6hyKZ2HZFkwgkbabOEH/sZe2l5NuiJ0MWd42PRDrEPIyKvFcrJlJQJCDAummcdOlU
         /UzIDj4gqKVsuHFm6PotfiOOMnVDQ2kaSuRuDYVwrcWuhTV7iNIBRZqSZWEiBIDsSvco
         /4xypa3bl5dLs7EJSzA97oqKe/dK4zVDXJCUfJl5FD/+0qXzILO6z6wT+YWcTFqmn4Lp
         OEOby7pa7fTq8Hr8HUlSIB3Ef8AhqOOTcyuZD9wzv3MCsa9y1Fuvu/dJrHxE5kGeyKDs
         9dkmF+iyvfmSLK0xitQOl4D31dOkN0wY6ExHUAmFYYWFMNl7N6VGdE1XRdPeqegcIJoW
         G6+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788983675; x=1789588475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JlgccNgxVbugZNqdrvfNlhMGvViQkc+NBOA9MC8f2/k=;
        b=rGaIlqp3hcgEkhc9SxQeNKcSHrVwe452joKcPDgEiVxaVyIaIdvGPYEzR2j6TGcd7U
         OQsgSVRMK9HamF8QecJrVzoN8xYmGvbGXp8kO41vtRLyjryxUBFShpGzAxKZz7NFOkJ2
         f4nnt7MIIUCs+dxBrHlZ4xdPVygpQ0LjKs7AOhvOT6CqCGvoBr+FpTTCXYwgYUeWyPNk
         /hY4IRELweBJMLbBKU/oAXPTRMfl5U7CM8a3YdY26lMunKObldZIgOo1sgFAUx0do4Ba
         4koc2W99FG3TpoJ5WywIGA9GtaTuWMYanmRIXG5SV4y2P0CrMTV6yhNyexVq9L4NXIRP
         D5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983675; x=1789588475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlgccNgxVbugZNqdrvfNlhMGvViQkc+NBOA9MC8f2/k=;
        b=J7+h3G/+IrPxuio9arNdRZbY8vBy9SnZxK8gzziH+K98Y7ILQppE9T5CCU+VRlIWvB
         NSCWESCRUqugqKnEh4c27/4WLwYsSzmjJtzYA7jmUr7lH1nLh8f91+2DK26fkVv4ZfJ2
         K2Wpmd9PcgGNoUH6uYZa/DsuuqGOayy08Ue+uEpdOg6+KqRjdqleK8lTTmHSJbBQBK/5
         vuP/ayP/W650SV+eGGqSgAA5vHFRujrBCD2bG1F1Zt9cHAr0tXvY9OLV7U0ImI8QfsKc
         md95lkD4R5PQRquZZARCqQ8kuLA2h5UnXRMa3ejvHoCUkvaSdlb/4Ew98wUyELLKEiC/
         4bTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8Oo22eaNeSnAzCamxjQPHqZJzajqPo5oq1DRwRaDeX7J8fGrIRLfciAnvjqDwLH50hUYwsaaZkItrtF4=@vger.kernel.org
X-Gm-Message-State: AFuF++mGhb6A4OLfWqfCin3dOGy84YA+9FZTtN7FZAvFVjjAP9N5xcaB
	fXlphWksusMzY7uhpcntfdv5ri+TUsvUpmb3EKFbLpl4N6WD5UmVhPi9kTst1SONKiA3ulWnq2L
	jRXOEg0gb9j1N6KkuP4sQiLaqNi22QeMQW6UHNyY=
X-Gm-Gg: AYBFou2rsv/T62pm3i7HL8AViJKuozrRtCiJHIKAsyAMK1eD04uPNfQY4k4nJ0ojTfB
	9GDJ/MP5OAX51rQIpDVEMb+knNEvNFbxC7AA51e+x8cjUAhO0QvuxVIWqVLXy5yIXGaftC4KocJ
	XRtuZblSRapB/osHqm5HpO9GGho3vv1AvjWxZnfzD8jaz1zSNrIZ4w2MyuhKi7r/SRQ4Y0dMQLo
	P3mTYFU2zLy+2BURIPCe5LdxU1SRG6HOCtLHfR/IvPPBv1UwPdVQDdm6c0/UpiCZYoXd4SLyf7J
	KSGiVZ4GOs3dlsMFEwMPKBe41U3M574pasmSh/YoqLo42tI5FpzbzCFWOHvuC0f6dZ0zq5D8TgF
	58TripV00OdOWNIiMN8D8lBp0mkV8OB6Qy1KrGlqbCzDYiuqnTiEJ
X-Received: by 2002:a05:6102:fa8:b0:78f:5bab:4761 with SMTP id
 ada2fe7eead31-78f5bab4867mr5091092137.8.1788983674408; Wed, 09 Sep 2026
 12:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-3-morbo@google.com> <20260908222734.3048684-1-morbo@google.com>
 <20260908222734.3048684-2-morbo@google.com> <76DEB9F0-5263-4AB0-816F-71A57F3B67BB@mainlining.org>
In-Reply-To: <76DEB9F0-5263-4AB0-816F-71A57F3B67BB@mainlining.org>
From: Bill Wendling <morbo@google.com>
Date: Wed, 9 Sep 2026 12:54:17 -0700
X-Gm-Features: AcwNN1ViNghJSNmdSoLp_huEp4YyT8-YIp0mFgB8ip3vTJjz-BjF1pqR5q5E2Ns
Message-ID: <CAGG=3QVX9irf_S-jBBUsV4Y1MZJyNPkKNATawREQ=3FqtBXYag@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] userns: Add KUnit test suite for uid_gid_map
To: Bradley Morgan <brads@mainlining.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:36=E2=80=AFAM Bradley Morgan <brads@mainlining.org=
> wrote:
> On 8 September 2026 23:27:30 BST, Bill Wendling <morbo@google.com> wrote:
> >diff --git a/init/Kconfig b/init/Kconfig
> >index 8583d9f06c52..27c1ffc675bf 100644
> >--- a/init/Kconfig
> >+++ b/init/Kconfig
> >@@ -1457,6 +1457,17 @@ config USER_NS
> >
> >         If unsure, say N.
> >
> >+config USER_NS_MAP_KUNIT_TEST
> >+      tristate "KUint test for user
>
> Hmm! s/KUint/KUnit
>
*headdesk*

-bw

>  namespace map insertion" if !KUNIT_ALL_TESTS
> >+      depends on USER_NS && KUNIT
> >+      default KUNIT_ALL_TESTS
> >+      help
> >+        This builds the KUnit test for user namespace uid/gid map inser=
tion.
> >+        It validates map insertion, limits, dynamic allocation of the
> >+        extended extents array, and mapping sorting functions.
> >+
> >+        If unsure, say N.
> >+
> > config PID_NS
> >       bool "PID Namespaces"
> >       default y
> >diff --git a/kernel/Makefile b/kernel/Makefile
> >index 1e1a31673577..2a64282749b8 100644
> >--- a/kernel/Makefile
> >+++ b/kernel/Makefile
> >@@ -141,6 +141,7 @@ obj-$(CONFIG_WATCH_QUEUE) +=3D watch_queue.o
> >
> > obj-$(CONFIG_RESOURCE_KUNIT_TEST) +=3D resource_kunit.o
> > obj-$(CONFIG_SYSCTL_KUNIT_TEST) +=3D sysctl-test.o
> >+obj-$(CONFIG_USER_NS_MAP_KUNIT_TEST) +=3D tests/user_ns_map_kunit.o
> >
> > CFLAGS_kstack_erase.o +=3D $(DISABLE_KSTACK_ERASE)
> > CFLAGS_kstack_erase.o +=3D $(call cc-option,-mgeneral-regs-only)
> >diff --git a/kernel/tests/.kunitconfig b/kernel/tests/.kunitconfig
> >new file mode 100644
> >index 000000000000..b3d1206fd81a
> >--- /dev/null
> >+++ b/kernel/tests/.kunitconfig
> >@@ -0,0 +1,4 @@
> >+CONFIG_KUNIT=3Dy
> >+CONFIG_NAMESPACES=3Dy
> >+CONFIG_USER_NS=3Dy
> >+CONFIG_USER_NS_MAP_KUNIT_TEST=3Dy
> >diff --git a/kernel/tests/user_ns_map_kunit.c b/kernel/tests/user_ns_map=
_kunit.c
> >new file mode 100644
> >index 000000000000..24c21e43a36c
> >--- /dev/null
> >+++ b/kernel/tests/user_ns_map_kunit.c
> >@@ -0,0 +1,98 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * KUnit test for user namespace map insertion and sorting.
> >+ */
> >+
> >+#define pr_fmt(fmt) "user_namespace: " fmt
> >+
> >+#include <kunit/test.h>
> >+#include <linux/user_namespace.h>
> >+
> >+#define NR_EXTENTS (UID_GID_MAP_MAX_BASE_EXTENTS + 5)
> >+
> >+static void user_ns_map_insert(struct kunit *test)
> >+{
> >+      struct uid_gid_map map;
> >+      struct uid_gid_extent extent;
> >+      int i, ret;
> >+
> >+      memset(&map, 0, sizeof(map));
> >+
> >+      /* Insert up to UID_GID_MAP_MAX_BASE_EXTENTS elements */
> >+      for (i =3D 0; i < UID_GID_MAP_MAX_BASE_EXTENTS; i++) {
> >+              extent.first =3D i * 10;
> >+              extent.lower_first =3D i * 100;
> >+              extent.count =3D 5;
> >+
> >+              ret =3D insert_extent(&map, &extent);
> >+              KUNIT_ASSERT_EQ(test, ret, 0);
> >+      }
> >+
> >+      KUNIT_EXPECT_EQ(test, map.nr_extents, UID_GID_MAP_MAX_BASE_EXTENT=
S);
> >+
> >+      /* Verify the elements ended up in the 'extent' array */
> >+      for (i =3D 0; i < UID_GID_MAP_MAX_BASE_EXTENTS; i++) {
> >+              KUNIT_EXPECT_EQ(test, map.extent[i].first, i * 10);
> >+              KUNIT_EXPECT_EQ(test, map.extent[i].lower_first, i * 100)=
;
> >+              KUNIT_EXPECT_EQ(test, map.extent[i].count, 5);
> >+      }
> >+}
> >+
> >+static void user_ns_map_insert_extended(struct kunit *test)
> >+{
> >+      struct uid_gid_map map;
> >+      struct uid_gid_extent extent;
> >+      int i, ret;
> >+
> >+      memset(&map, 0, sizeof(map));
> >+
> >+      /* Insert more than UID_GID_MAP_MAX_BASE_EXTENTS elements */
> >+      for (i =3D 0; i < NR_EXTENTS; i++) {
> >+              int value =3D 9 - i;
> >+
> >+              extent.first =3D value * 10;
> >+              extent.lower_first =3D value * 100;
> >+              extent.count =3D 5;
> >+
> >+              ret =3D insert_extent(&map, &extent);
> >+              KUNIT_ASSERT_EQ(test, ret, 0);
> >+      }
> >+
> >+      KUNIT_EXPECT_EQ(test, map.nr_extents, NR_EXTENTS);
> >+
> >+      /* Now sort the map to set up reverse mapping */
> >+      ret =3D sort_idmaps(&map);
> >+      KUNIT_ASSERT_EQ(test, ret, 0);
> >+      KUNIT_ASSERT_NOT_ERR_OR_NULL(test, map.reverse);
> >+
> >+      /* Verify the elements are in 'forward' and that sorting is corre=
ct */
> >+      for (i =3D 0; i < map.nr_extents; i++) {
> >+              KUNIT_EXPECT_EQ(test, map.forward[i].first, i * 10);
> >+              KUNIT_EXPECT_EQ(test, map.forward[i].lower_first, i * 100=
);
> >+              KUNIT_EXPECT_EQ(test, map.forward[i].count, 5);
> >+
> >+              KUNIT_EXPECT_EQ(test, map.reverse[i].first, i * 10);
> >+              KUNIT_EXPECT_EQ(test, map.reverse[i].lower_first, i * 100=
);
> >+              KUNIT_EXPECT_EQ(test, map.reverse[i].count, 5);
> >+      }
> >+
> >+      kfree(map.forward);
> >+      kfree(map.reverse);
> >+}
> >+
> >+static struct kunit_case user_ns_map_test_cases[] =3D {
> >+      KUNIT_CASE(user_ns_map_insert),
> >+      KUNIT_CASE(user_ns_map_insert_extended),
> >+      {}
> >+};
> >+
> >+static struct kunit_suite user_ns_map_test_suite =3D {
> >+      .name =3D "user_ns_map",
> >+      .test_cases =3D user_ns_map_test_cases,
> >+};
> >+
> >+kunit_test_suite(user_ns_map_test_suite);
> >+
> >+MODULE_LICENSE("GPL");
> >+MODULE_DESCRIPTION("KUnit test for user namespace map insertion");
> >+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> >diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> >index 786dbf0506ca..d8cbefd36598 100644
> >--- a/kernel/user_namespace.c
> >+++ b/kernel/user_namespace.c
> >@@ -1,5 +1,6 @@
> > // SPDX-License-Identifier: GPL-2.0-only
> >
> >+#include <kunit/visibility.h>
> > #include <linux/export.h>
> > #include <linux/nsproxy.h>
> > #include <linux/slab.h>
> >@@ -786,7 +787,8 @@ static bool mappings_overlap(struct uid_gid_map *new=
_map,
> >  * Takes care to allocate a 4K block of memory if the number of mapping=
s exceeds
> >  * UID_GID_MAP_MAX_BASE_EXTENTS.
> >  */
> >-static int insert_extent(struct uid_gid_map *map, struct uid_gid_extent=
 *extent)
> >+VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
> >+                                 struct uid_gid_extent *extent)
> > {
> >       struct uid_gid_extent *dest;
> >
> >@@ -822,6 +824,7 @@ static int insert_extent(struct uid_gid_map *map, st=
ruct uid_gid_extent *extent)
> >       *dest =3D *extent;
> >       return 0;
> > }
> >+EXPORT_SYMBOL_IF_KUNIT(insert_extent);
> >
> > /* cmp function to sort() forward mappings */
> > static int cmp_extents_forward(const void *a, const void *b)
> >@@ -857,7 +860,7 @@ static int cmp_extents_reverse(const void *a, const =
void *b)
> >  * sort_idmaps - Sorts an array of idmap entries.
> >  * Can only be called if number of mappings exceeds UID_GID_MAP_MAX_BAS=
E_EXTENTS.
> >  */
> >-static int sort_idmaps(struct uid_gid_map *map)
> >+VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
> > {
> >       if (map->nr_extents <=3D UID_GID_MAP_MAX_BASE_EXTENTS)
> >               return 0;
> >@@ -878,6 +881,7 @@ static int sort_idmaps(struct uid_gid_map *map)
> >
> >       return 0;
> > }
> >+EXPORT_SYMBOL_IF_KUNIT(sort_idmaps);
> >
> > /**
> >  * verify_root_map() - check the uid 0 mapping
> >
>
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.ne=
t/
